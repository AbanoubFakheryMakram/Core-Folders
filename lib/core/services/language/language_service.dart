import 'package:core_folders/app_lib.dart';

abstract class LanguageService {
  /// languages [ar, en]
  AppLanguages changeLanguage(AppLanguages langCode);
  void saveNewLanguage(AppLanguages language);
  Future<AppLanguages> loadLanguage();
  AppLanguages getLangCode();
  bool isArabic();
  bool isEnglish();
}