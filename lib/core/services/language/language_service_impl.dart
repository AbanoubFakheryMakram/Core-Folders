import 'package:core_folders/app_lib.dart';

class LanguageServiceImpl implements LanguageService {

  var cacheService = serviceLocator<CacheService>();

  // the app on first time launch will try to get system language
  // if the used language is not supported inside the app then the [ english ] will be the default
  AppLanguages _language = AppLanguages.en;

  @override
  AppLanguages getLangCode() => _language;

  @override
  AppLanguages changeLanguage(AppLanguages language) {
    _language = language;
    saveNewLanguage(_language);
    return _language;
  }

  @override
  void saveNewLanguage(AppLanguages language) {
    cacheService.setLanguage(language.name);
  }

  @override
  Future<AppLanguages> loadLanguage() async {
    String? langCode = await cacheService.getLanguage();
    return _getSavedLanguage(langCode);
  }

  @override
  bool isArabic() {
    return _language == AppLanguages.ar;
  }

  @override
  bool isEnglish() {
    return _language == AppLanguages.en;
  }

  AppLanguages _getSavedLanguage(String? langCode) {
    if(langCode == null) {
      _onNoLanguageSaved();
    } else if(langCode == 'ar') {
      _language = AppLanguages.ar;
    } else {
      _language = AppLanguages.en;
    }

    return _language;
  }

  void _onNoLanguageSaved() {
      final String systemLocale = Platform.localeName;
    if(systemLocale.startsWith('ar')) {
      _language = AppLanguages.ar;
    } else {
      _language = AppLanguages.en;
    }
  }
}