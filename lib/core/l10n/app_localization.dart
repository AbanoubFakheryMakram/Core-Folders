import 'package:core_folders/app_lib.dart';

class AppLocalization {
  static AppLocalizations get translation => AppLocalizations.of(context)!;

  static List<Locale> supportedLanguages = const [
    Locale('ar'),
    Locale('en'),
  ];
}
