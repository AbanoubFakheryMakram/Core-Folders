import 'package:core_folders/app_lib.dart';

class LengthValidator implements CustomValidator<String> {
  @override
  String? validate(value, {String? message, String? oldValue, int maxNum = 100, int min = 2}) {
    if (value.isNullOrEmpty()) return null;
    if (value != null) {
      if (value.length < min || value.length > maxNum) return message ?? AppLocalization.translation.lengthErrorMessage(maxNum.toString(), min.toString());
    }
    return null;
  }
}
