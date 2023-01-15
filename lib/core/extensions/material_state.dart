import 'package:flutter/material.dart';

extension WBMaterialStateProperty on MaterialStateProperty {
  static MaterialStateProperty<T> resolveEnabled<T>(
    T Function(bool enabled) callback,
  ) =>
      MaterialStateProperty.resolveWith<T>(
        (states) => callback(!states.contains(MaterialState.disabled)),
      );
}
