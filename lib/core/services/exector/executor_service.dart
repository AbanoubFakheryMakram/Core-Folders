import 'package:core_folders/app_lib.dart';
import 'package:dartz/dartz.dart';

// custom handling and if return true then no need to handle case
typedef HandelErrorCallBack = Future<bool> Function({Failure failure, Exception exception});
typedef EitherResultCallBack<T> = Future<Either<Failure, T>> Function();

abstract class ActionExecutorService {
  Future<Either<Failure, T>> execute<T>(EitherResultCallBack<T> action, {bool checkInternet = true, HandelErrorCallBack? handleError});
}