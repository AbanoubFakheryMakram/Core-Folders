import 'package:core_folders/app_lib.dart';

class RequiredValidator<T extends Object> extends CustomValidator<T> {
  @override
  String? validate(T? value, {String? message}) {
    if (value?.toString().isNullOrEmpty() == true) {
      return message ?? AppLocalization.translation.requiredField;
    }
    return null;
  }
}