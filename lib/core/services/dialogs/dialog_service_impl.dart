import 'package:core_folders/app_lib.dart';
import 'package:flutter/cupertino.dart';

class DialogImplService implements DialogService {
  BuildContext get context => NavigationService.navigatorKey.currentContext!;

  @override
  Future<T?> showAndroidDialog<T>({
    required Widget acceptWidget,
    required ResultCallBack<T?> acceptCallBack,
    required Widget cancelWidget,
    required ResultCallBack<T?> cancelCallBack,
    Widget? title,
    Widget? body,
  }) async {
    var result = await _showDialog<T>(
      AlertDialog(
        title: title,
        content: body,
        actions: <Widget>[
          TextButton(
            onPressed: () => _dismissDialog(context, acceptCallBack),
            child: acceptWidget,
          ),
          TextButton(
            onPressed: () => _dismissDialog(context, cancelCallBack),
            child: cancelWidget,
          ),
        ],
      ),
      dismissible: false,
    );
    return result;
  }

  @override
  Future<T?> showIOSDialog<T>({
    required Widget acceptWidget,
    required Widget cancelWidget,
    required ResultCallBack<T?> acceptCallBack,
    required ResultCallBack<T?> cancelCallBack,
    Widget? title,
    Widget? body,
  }) async {
    var result = await _showDialog<T>(
      CupertinoAlertDialog(
        title: title,
        content: body,
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: acceptWidget,
            onPressed: () => _dismissDialog(context, acceptCallBack),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: cancelWidget,
            onPressed: () => _dismissDialog(context, cancelCallBack),
          )
        ],
      ),
      dismissible: false,
    );
    return result;
  }

  @override
  Future<T?> showCustomDialog<T>({
    required Widget bodyWidget,
    bool dismissible = true,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
    EdgeInsets margin = const EdgeInsets.all(15),
    Duration transitionDuration = const Duration(milliseconds: 550),
  }) async {
    return showGeneralDialog<T>(
      context: context,
      barrierColor: Colors.black54,
      barrierLabel: "Barrier",
      barrierDismissible: dismissible,
      transitionDuration: transitionDuration,
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: margin,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: padding,
                    child: bodyWidget,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Future<T?> showInfoDialog<T>({
    required Widget body,
    required Widget actionButton,
    required ResultCallBack<T?> callback,
    Widget? title,
    Widget? bodyWidget,
    bool dismissible = false,
  }) async {
    var result = await _showDialog<T>(
      AlertDialog(
        title: title,
        content: body,
        actions: <Widget>[
          TextButton(
            onPressed: () => _dismissDialog(context, callback),
            child: actionButton,
          ),
        ],
      ),
      dismissible: dismissible,
    );

    return result;
  }

  Future<T?> _showDialog<T>(Widget dialog, {bool dismissible = false}) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) {
        return WillPopScope(onWillPop: () => Future.value(dismissible), child: dialog);
      },
    );
  }

  Future<void> _dismissDialog(BuildContext context, ResultCallBack callback) async {
    var result = await callback.call();
    Navigator.pop(context, result);
  }
}