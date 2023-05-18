import 'package:core_folders/app_lib.dart';

typedef AsyncResultCallBack<T> = Future<T> Function();
typedef ResultCallBack<T> = T Function();

abstract class DialogService {
  Future<T?> showAndroidDialog<T>({
    required Widget acceptWidget,
    required ResultCallBack<T?> acceptCallBack,
    required Widget cancelWidget,
    required ResultCallBack<T?> cancelCallBack,
    Widget? title,
    Widget? body,
  });

  Future<T?> showIOSDialog<T>({
    required Widget acceptWidget,
    required ResultCallBack<T?> acceptCallBack,
    required Widget cancelWidget,
    required ResultCallBack<T?> cancelCallBack,
    Widget? title,
    Widget? body,
  });

  Future<T?> showInfoDialog<T>({
    required Widget body,
    required Widget actionButton,
    required ResultCallBack<T?> callback,
    Widget? title,
    Widget? bodyWidget,
    bool dismissible = false,
  });

  /// when want to return output should call Navigator.pop(context, result);
  Future<T?> showCustomDialog<T>({
    required Widget bodyWidget,
    bool dismissible = true,
    EdgeInsets padding = const EdgeInsets.all(16),
    EdgeInsets margin = const EdgeInsets.all(22),
    Duration transitionDuration = const Duration(milliseconds: 450),
  });
}
