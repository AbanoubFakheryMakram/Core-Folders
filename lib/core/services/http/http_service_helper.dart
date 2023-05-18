import 'package:core_folders/app_lib.dart';

class HttpServiceHelper {
  static Duration requestDuration = const Duration(seconds: 30);

  static final _httpController = serviceLocator<HttpService>();
  static final _tokenController = serviceLocator<TokenUtils>();

  static BaseOptions options() {
    return BaseOptions(
      receiveTimeout: requestDuration,
      sendTimeout: requestDuration,
      connectTimeout: requestDuration,
      baseUrl: ApiRoutes.baseURl,
      followRedirects: false,
      validateStatus: (status) {
        return status! <= 500;
      },
      headers: {
        'Accept': "application/json",
      },
    );
  }

  static InterceptorsWrapper buildInterceptor() {
    return InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    );
  }

  static void _onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      var token = await _tokenController.getToken();
      if (token != null && !token.accessToken.isNullOrEmpty()) {
        if (token.shouldRefreshToken(DateTime.now().add(const Duration(minutes: 2)).toUtc())) {
          await _refreshToken();
        }
      }

      if (!options.path.contains('ui_locales')) {
        final _settingsController = serviceLocator<ConfigurationsService>();
        options.queryParameters.addAll({'lang': _settingsController.locale});
      }

      if (token != null && token.accessToken != null) {
        options.headers.addAll({
          'Authorization': '${token.tokenType} ${token.accessToken}',
        });
      }
    } finally {
      handler.next(options); // must call it to continue request
    }
  }

  static void _onError(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401 || error.response?.statusCode == 403) {
      var success = await _refreshToken();
      if (success) {
        // retry old action
        handler.resolve(await _httpController.retry(error.requestOptions));
      }
    } else {
      handler.next(error);
    }
  }

  static void _onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401 || response.statusCode == 403) {
      await _refreshToken();
      handler.resolve(await _httpController.retry(response.requestOptions));
    } else {
      if (response.statusCode != 204) {
        if (response.data is! String) {
          var result = BaseResponse.fromJson(response.data);
          if (result.Status == 1 && result.Message == null) {
            throw Exception("Service Exception: ${result.Message}");
          }
        }
      }

      handler.resolve(response);
    }
  }

  static PrettyDioLogger buildPrettyDioLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      maxWidth: 90,
    );
  }

  static Future<bool> _refreshToken() async {
    UserCredential? userCredential = await serviceLocator<UserCredentialUtils>().getUserCredential();
    if (userCredential != null) {
      var response = await serviceLocator<LoginUsecase>().login(_buildGetTokenRequest(userCredential));
      if (response?.accessToken != null) {
        return Future.value(true);
      } else {
        await _logoutUser(response);
        return Future.value(false);
      }
    }

    return Future.value(false);
  }

  static Future<void> _logoutUser(TokenResponse? response) async {

  }

  static GetTokenRequest _buildGetTokenRequest(UserCredential userCredential) {
    return GetTokenRequest(
      username: userCredential.username,
      password: userCredential.password,
    );
  }
}
