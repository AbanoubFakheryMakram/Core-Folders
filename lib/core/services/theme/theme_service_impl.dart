import 'package:core_folders/app_lib.dart';

class ThemeServiceImpl implements ThemeService {
  ThemeMode _currentThemeMode = ThemeMode.dark; // for first time launch default theme will be dark theme

  @override
  ThemeMode changeTheme(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.LIGHT:
        _currentThemeMode = ThemeMode.light;
        break;
      case AppThemeMode.DARK:
        _currentThemeMode = ThemeMode.dark;
        break;
      case AppThemeMode.SYSTEM:
        _currentThemeMode = ThemeMode.system;
        break;
    }

    _saveTheme(mode);
    return _currentThemeMode;
  }

  void _saveTheme(AppThemeMode mode) {
    var storageController = serviceLocator<CacheService>();
    switch (mode) {
      case AppThemeMode.LIGHT:
        storageController.setTheme(AppThemeMode.LIGHT.name);
        break;
      case AppThemeMode.DARK:
        storageController.setTheme(AppThemeMode.DARK.name);
        break;
      case AppThemeMode.SYSTEM:
        storageController.setTheme(AppThemeMode.SYSTEM.name);
        break;
    }
  }

  @override
  Future<ThemeMode> loadSavedTheme() async {
    String? themeName = await serviceLocator<CacheService>().getTheme();
    return _getTheme(themeName);
  }

  ThemeMode _getTheme(String? themeName) {
    switch (themeName) {
      case 'LIGHT':
        _currentThemeMode = ThemeMode.light;
        return _currentThemeMode;
      case 'DARK':
        _currentThemeMode = ThemeMode.dark;
        return _currentThemeMode;
      case 'SYSTEM':
        _currentThemeMode = ThemeMode.system;
        return _currentThemeMode;
      default:
        return _currentThemeMode;
    }
  }

  @override
  ThemeMode getCurrentThemeMode() {
    return _currentThemeMode;
  }
}
