import 'package:core_folders/app_lib.dart';

abstract class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  Future<void> pop<T>({T? data});

  void popWithContext<T>(BuildContext context, {T? data});

  bool canPop();

  Future<T?> push<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration});

  Future<T?> pushWithContext<T>(BuildContext context, Widget page, {PageTransitionType? transitionType, Duration? transitionDuration});

  Future<T?> pushReplacement<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration});

  Future<T?> pushAndRemoveUntil<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration});

  Future<void> removeRoute<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration});

  Future<void> removePagesBelow<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration});

  Future<T?> setRootPage<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration});
}

BuildContext get context => NavigationService.context;
