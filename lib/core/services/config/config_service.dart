import 'package:core_folders/app_lib.dart';

final configService = ChangeNotifierProvider((_) => serviceLocator<ConfigurationsService>());

class ConfigurationsService with ChangeNotifier {

  final _languageController = serviceLocator<LanguageService>();
  final _themeController = serviceLocator<ThemeService>();
  final _cacheController = serviceLocator<CacheService>();

  var homeKey = UniqueKey();

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  late String _locale;
  String get locale => _locale;

  late bool _canRunOnThisDevice;
  bool get canRunOnThisDevice => _canRunOnThisDevice;

  Future<void> loadSettings() async {

    // can run app on this device (security vulnerabilities)
    _canRunOnThisDevice = await serviceLocator<SafeDeviceController>().canRunTheAppOnThisDevice();

    // load theme
    await _themeController.loadSavedTheme();
    _themeMode = _themeController.getCurrentThemeMode();

    // load language
    await _languageController.loadLanguage();
    _locale = _languageController.getLangCode().name;

    // clear cached data for ios
    await _cacheController.clearCachedDataIfIsFirstTimeLaunch();

    // webview config
    await _initWebViewConfiguration();

    // setup firebase crashlytics
    await serviceLocator<FirebaseService>().startListenToErrors();

    notifyListeners();
  }

  void changeTheme(AppThemeMode mode) {
    _themeMode = _themeController.changeTheme(mode);
    notifyListeners();
  }

  void changeLanguage(AppLanguages language) {
    _locale = _languageController.changeLanguage(language).name;
    _updateIndexedStackState();
    notifyListeners();
  }

  void _updateIndexedStackState() {
    homeKey = UniqueKey();
  }

  Future<void> _initWebViewConfiguration() async {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  bool isArabic() {
    return _languageController.isArabic();
  }

  bool isEnglish() {
    return _languageController.isEnglish();
  }
}