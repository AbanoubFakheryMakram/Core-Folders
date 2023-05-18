import 'package:core_folders/app_lib.dart';

class EmailValidator implements CustomValidator<String> {
  @override
  String? validate(value, {String? message}) {
    if (value.isNullOrEmpty()) return AppLocalization.translation.requiredField;
    if (_validEmail(value!)) return null;
    return message ?? AppLocalization.translation.emailErrorMessage;
  }

  bool _validEmail(String value) {
    String pattern = r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
