import 'package:flutter/material.dart';

extension WBMaterialStateProperty on MaterialStateProperty {
  static MaterialStateProperty<T> resolveEnabled<T>(
    T Function(bool enabled) callback,
  ) =>
      MaterialStateProperty.resolveWith<T>(
        (states) => callback(!states.contains(MaterialState.disabled)),
      );

  static MaterialStateProperty<T> resolveSelected<T>(
    T Function(bool selected) callback,
  ) =>
      MaterialStateProperty.resolveWith<T>(
        (states) => callback(states.contains(MaterialState.selected)),
      );
}

extension GSMaterialStateTextStyle on MaterialStateTextStyle {
  static MaterialStateTextStyle resolveFocused(
    TextStyle Function(bool focused) callback,
  ) =>
      MaterialStateTextStyle.resolveWith(
        (states) => callback(states.contains(MaterialState.focused)),
      );
}
