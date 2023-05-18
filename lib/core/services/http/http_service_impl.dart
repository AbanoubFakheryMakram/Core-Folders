import 'package:core_folders/app_lib.dart';

class HttpServiceImpl implements HttpService {

  Dio dio = serviceLocator<Dio>();

  HttpServiceImpl() {
    dio.options = HttpServiceHelper.options();
    dio.interceptors.add(HttpServiceHelper.buildInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(HttpServiceHelper.buildPrettyDioLoggerInterceptor());
    }
  }

  @override
  Future<Response> get(String url, {RequestData? requestData}) async {
    _handleCustomRequestData(requestData);
    Response response = await dio.get(url);
    return response;
  }

  @override
  Future<Response> post(String url, Object requestBody, {RequestData? requestData}) async {
    _handleCustomRequestData(requestData);
    Response response = await dio.post(url, data: requestBody);
    return response;
  }

  @override
  Future<Response> delete(String url, {RequestData? requestData}) async {
    _handleCustomRequestData(requestData);
    Response response = await dio.delete(url);
    return response;
  }

  @override
  Future<Response> put(String url, Map<String, dynamic> requestBody, {RequestData? requestData}) async {
    _handleCustomRequestData(requestData);
    Response response = await dio.put(url, data: requestBody);
    return response;
  }

  @override
  Future<Response> patch(String url, Map<String, dynamic> requestBody, {RequestData? requestData}) async {
    _handleCustomRequestData(requestData);
    Response response = await dio.patch(url, data: requestBody);
    return response;
  }

  @override
  Future<Response> postWithFile(String url, requestBody, {RequestData? requestData}) async {
    _handleCustomRequestData(requestData);
    Response response = await dio.post(url, data: FormData.fromMap(requestBody));
    return response;
  }

  @override
  Future<Response> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  void _handleCustomRequestData(RequestData? requestData) {
    requestData ??= RequestData(contentType: Headers.jsonContentType);
    if (requestData.headers != null && requestData.headers!.isNotEmpty) {
      dio.options.headers.addAll(requestData.headers!);
    }
    if (requestData.contentType != null) {
      dio.options.contentType = requestData.contentType.toString();
    }
    if(requestData.params != null) {
      dio.options.queryParameters = requestData.params!;
    }
  }
}