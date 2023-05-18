import 'package:core_folders/app_lib.dart';

class MinLengthValidator implements CustomValidator<String> {
  @override
  String? validate(value, {String? message, String? oldValue, int maxNum = 100, int min = 2}) {
    if (value.isNullOrEmpty()) return null;
    if (value!.length < min || value.length > maxNum) {
      return AppLocalization.translation.lengthErrorMessage(maxNum.toString(), min.toString());
    }
    return null;
  }
}
