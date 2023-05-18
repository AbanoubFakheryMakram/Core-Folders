import 'package:core_folders/app_lib.dart';

class AppSizes {
  static bool isTablet = ScreenUtil().screenWidth > 750;
  static Size appBarSize = Size(MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.width, 65.h);
  static double textFormFieldHeight = 55.h;
  static double bottomBarHeight = 70.h;
}