import 'package:core_folders/app_lib.dart';

abstract class ThemeService {
  ThemeMode getCurrentThemeMode();
  ThemeMode changeTheme(AppThemeMode mode);
  Future<ThemeMode> loadSavedTheme();
}