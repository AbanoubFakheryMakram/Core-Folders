import 'package:core_folders/app_lib.dart';

class SpaceValidator<T extends Object> extends CustomValidator<T> {
  @override
  String? validate(T? value, {String? message}) {
    if (value?.toString().isNullOrEmpty() == false && value.toString().contains(" ") == true) {
      return message ?? AppLocalization.translation.spaceNotAllowed;
    }
    return null;
  }
}