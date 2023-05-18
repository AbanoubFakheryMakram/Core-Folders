import '../../app_lib.dart';

class FailureHandler {

  Failure getFailureType(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return RequestCanceledFailure(msg: AppLocalization.translation.requestHasCancelledErrorMessage);
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectionTimeout:
        return ConnectionTimeoutFailure(msg: AppLocalization.translation.requestTimeoutErrorMessage);
      case DioErrorType.badResponse:
      case DioErrorType.unknown:
        return _handleStatuesCodeResponse(dioError.response);
      case DioErrorType.connectionError:
      case DioErrorType.badCertificate:
        return NoInternetConnectionFailure();
    }
  }

  dynamic _handleStatuesCodeResponse(Response? response) {
    if (response == null) {
      return UnknownFailure(msg: AppLocalization.translation.genericError);
    } else {
      switch (response.statusCode) {
        case 200:
          return response;
        case 500:
          return InternalServerErrorFailure(msg: AppLocalization.translation.genericError);
        case 400:
          return BadRequestFailure(msg: AppLocalization.translation.badRequestMsg);
        case 401:
          return UnauthorizedFailure(msg: AppLocalization.translation.unAuthorizedError);
        case 404:
          return NotFoundFailure(msg: AppLocalization.translation.notFound);
        case 405:
          return MethodNotAllowedFailure(msg: AppLocalization.translation.methodNotAllowed);
        case 408:
          return ConnectionTimeoutFailure(msg: AppLocalization.translation.requestTimeoutErrorMessage);
        default:
          return NoInternetConnectionFailure(msg: AppLocalization.translation.noInternetConnection);
      }
    }
  }
}