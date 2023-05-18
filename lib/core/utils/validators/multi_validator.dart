
typedef BoolCallBack = bool Function();

abstract class MultiValidator {
  static String? validate<T>(List<String?> validators, {BoolCallBack? overrideMessage, String? messageToAppear = ''}) {
    if (overrideMessage?.call() == true) {
      return messageToAppear;
    }
    for (var element in validators) {
      String? result = element;
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}