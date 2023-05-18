import 'package:flutter/material.dart';

extension Utility on BuildContext {
  void nextBlankTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild!.context == null);
  }
}
