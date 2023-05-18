import 'package:core_folders/app_lib.dart';

class NavigationServiceImpl implements NavigationService {
  final _navigatorKey = NavigationService.navigatorKey;
  BuildContext? _context;

  @override
  Future<void> pop<T>({T? data}) async {
    if (Navigator.canPop(_navigatorKey.currentContext!)) {
      _navigatorKey.currentState!.pop(data);
    }
  }

  /// pushes the page to the top of the stack
  @override
  Future<T?> push<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration}) {
    return WidgetsBinding.instance.waitUntilFirstFrameRasterized.then(
      (value) {
        return _navigatorKey.currentState!.push(
          PageTransition(
            child: page,
            type: transitionType ?? PageTransitionType.fade,
            duration: transitionDuration ?? const Duration(milliseconds: 200),
            reverseDuration: transitionDuration ?? const Duration(milliseconds: 280),
          ),
        );
      },
    );
  }

  /// removes the current page from the navigation stack and push sent page in stack
  @override
  Future<T?> pushReplacement<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration}) {
    return WidgetsBinding.instance.waitUntilFirstFrameRasterized.then(
      (value) {
        return _navigatorKey.currentState!.pushReplacement(
          PageTransition(
            child: page,
            type: transitionType ?? PageTransitionType.fade,
            duration: transitionDuration ?? const Duration(milliseconds: 200),
            reverseDuration: transitionDuration ?? const Duration(milliseconds: 280),
          ),
        );
      },
    );
  }

  /// removes all pages on the stack and pushes the page to it
  @override
  Future<T?> setRootPage<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration}) {
    return WidgetsBinding.instance.waitUntilFirstFrameRasterized.then(
      (value) {
        return _navigatorKey.currentState!.pushAndRemoveUntil(
            PageTransition(
              child: page,
              type: transitionType ?? PageTransitionType.fade,
              duration: transitionDuration ?? const Duration(milliseconds: 200),
              reverseDuration: transitionDuration ?? const Duration(milliseconds: 280),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Future<T?> pushWithContext<T>(BuildContext context, Widget page, {PageTransitionType? transitionType, Duration? transitionDuration}) {
    _context = context;
    return WidgetsBinding.instance.waitUntilFirstFrameRasterized.then((value) {
        return Navigator.push(
          context,
          PageTransition(
            child: page,
            type: transitionType ?? PageTransitionType.fade,
            duration: transitionDuration ?? const Duration(milliseconds: 200),
            reverseDuration: transitionDuration ?? const Duration(milliseconds: 280),
          ),
        );
      },
    );
  }

  @override
  void popWithContext<T>(BuildContext context, {T? data}) {
    _context = context;
    Navigator.pop(context, data);
  }

  @override
  bool canPop() {
    if(_context != null) {
      return Navigator.of(_context!).canPop();
    } else {
      return false;
    }
  }

  @override
  Future<T?> pushAndRemoveUntil<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration}) async {
    return WidgetsBinding.instance.waitUntilFirstFrameRasterized.then((value) => _navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      ),
    );
  }

  @override
  Future<void> removeRoute<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration}) async {
    WidgetsBinding.instance.waitUntilFirstFrameRasterized.then(
      (value) => _navigatorKey.currentState!.removeRoute(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      ),
    );
  }

  @override
  Future<void> removePagesBelow<T>(Widget page, {PageTransitionType? transitionType, Duration? transitionDuration}) async {
    WidgetsBinding.instance.waitUntilFirstFrameRasterized.then((value) => _navigatorKey.currentState!.removeRouteBelow(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      ),
    );
  }
}