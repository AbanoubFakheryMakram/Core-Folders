import 'package:core_folders/app_lib.dart';

class UrlValidator implements CustomValidator<String> {
  @override
  String? validate(value, {String? message, String? oldValue, int maxNum = 100}) {
    if (value.isNullOrEmpty()) return null;
    if (!RegExp(r"^(?:http|https)://[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~\\+#]*$", caseSensitive: false).hasMatch(value!)) {
      return AppLocalization.translation.enterValidUrl;
    }
    return null;
  }
}