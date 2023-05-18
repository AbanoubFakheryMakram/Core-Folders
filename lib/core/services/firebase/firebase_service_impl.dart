import 'dart:isolate';

import 'package:core_folders/app_lib.dart';

class FirebaseServiceImpl implements FirebaseService {

  var firebaseCrashlytics = FirebaseCrashlytics.instance;

  @override
  Future<void> startListenToErrors() async {
    await logErrorsToFirebase();
    await logAsynchronousErrorsToFirebase();
  }

  @override
  Future<void> recordErrorToFirebase(error, StackTrace st, reason) async {
    try {
      firebaseCrashlytics.recordError(error, st, reason: reason);
    } catch (ex) {}
  }

  @override
  void makeCrash() {
    firebaseCrashlytics.crash();
  }

  // In order to catch any asynchronous errors that aren't handled by Flutter framework
  @override
  Future<void> logAsynchronousErrorsToFirebase() async {
    PlatformDispatcher.instance.onError = (error, stack) {
      firebaseCrashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }

  @override
  Future<void> logErrorsToFirebase() async {
    FlutterError.onError = firebaseCrashlytics.recordFlutterError;
    firebaseCrashlytics.setCrashlyticsCollectionEnabled(true);
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await firebaseCrashlytics.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
      );
    }).sendPort);
  }
}