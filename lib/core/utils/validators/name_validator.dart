import 'package:core_folders/app_lib.dart';

class EnglishNameValidator implements CustomValidator<String> {
  @override
  String? validate(value, {String? message, String? oldValue, int maxNum = 100, int min = 2}) {
    if (value.isNullOrEmpty()) return null;
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
      return AppLocalization.translation.allowsOnlyCharsEnglish;
    }
    if (value.length < min || value.length > maxNum) return message ?? AppLocalization.translation.lengthErrorMessage(maxNum.toString(), min.toString());
    return null;
  }
}

class ArabicNameValidator implements CustomValidator<String> {
  @override
  String? validate(value, {String? message, String? oldValue, int maxNum = 100, int min = 2}) {
    if (value.isNullOrEmpty()) return null;
    if (!RegExp(r'^[\u0600-\u06FF ]+$').hasMatch(value!)) {
      return AppLocalization.translation.allowsOnlyCharsArabic;
    }
    if (value.length < min || value.length > maxNum) return message ?? AppLocalization.translation.lengthErrorMessage(maxNum.toString(), min.toString());
    return null;
  }
}

class NameValidator implements CustomValidator<String> {
  @override
  String? validate(value, {String? message, String? oldValue, int maxNum = 100, int min = 2}) {
    if (value.isNullOrEmpty()) return null;
    if (value != null) {
      if (value.length < min || value.length > maxNum) {
        return message ?? AppLocalization.translation.lengthErrorMessage(maxNum.toString(), min.toString());
      } else if(!RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$').hasMatch(value)) {
        return message ?? AppLocalization.translation.nameErrorMessage;
      }
    }
    return null;
  }
}
