import 'package:core_folders/app_lib.dart';
import 'package:dartz/dartz.dart';

class ActionExecutorServiceImpl extends ActionExecutorService {
  final NetworkService connectivityService;
  final DialogService dialogService;
  final NavigationService navigationService;

  ActionExecutorServiceImpl({required this.connectivityService, required this.dialogService, required this.navigationService});

  @override
  Future<Either<Failure, T>> execute<T>(EitherResultCallBack<T> action, {bool checkInternet = true, HandelErrorCallBack? handleError}) async {
    try {
      if (checkInternet) {
        await _checkInternetConnection(callBack: () => execute<T>(action, checkInternet: checkInternet, handleError: handleError));
      }
      var result = await action.call();
      if (result is Left) {
        _showErrorDialog((result as Left).value);
      }
      return result;
    } on DioError catch (error, st) {
      var failure = serviceLocator<FailureHandler>().getFailureType(error);
      _showErrorDialog(failure);
      serviceLocator<FirebaseService>().recordErrorToFirebase(error, st, 'API ERROR: $error');
      return Left(failure);
    } catch (error, st) {
      var handled = await handleError?.call(failure: CustomFailure(data: error.toString()));
      if (handled != true) {
        _showErrorDialog(CustomFailure(data: AppLocalization.translation.genericError));
      }
      serviceLocator<FirebaseService>().recordErrorToFirebase(error, st, 'API GENERIC ERROR: $error');
      return Left(UnknownFailure());
    }
  }

  Future<bool> _checkInternetConnection({VoidCallback? callBack}) async {
    var connected = await connectivityService.hasConnection;
    if (!connected) {
      await navigationService.push(NoInternetConnectionPage(afterNetworkBackCallback: callBack));
    }

    return connected;
  }

  Future<void> _showErrorDialog(Failure failure) async {
    await dialogService.showCustomDialog(bodyWidget: InfoDialog(body: failure.msg ?? '', title: AppLocalization.translation.errorTitle));
  }
}