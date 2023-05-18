import 'package:core_folders/app_lib.dart';

class ConfirmPasswordValidator extends CustomValidatorWithOldValue<String> {
  @override
  String? validate(String? value, {required String oldValue, String? message}) {
    if (value == null) return null;
    if (!value.equalIgnoreCase(oldValue)) {
      return message ?? AppLocalization.translation.confirmPasswordErrorMessage;
    }
    return null;
  }
}
