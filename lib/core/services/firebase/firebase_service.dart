abstract class FirebaseService {
  Future<void> recordErrorToFirebase(dynamic error, StackTrace st, dynamic reason);
  Future<void> logErrorsToFirebase();
  Future<void> logAsynchronousErrorsToFirebase();
  Future<void> startListenToErrors();
  void makeCrash();
}