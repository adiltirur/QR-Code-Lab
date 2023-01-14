import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

extension TDBadKeyException on BadKeyException {
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'map': map.keys.toList(),
    };
  }

  String toLogString() => const JsonEncoder.withIndent('  ').convert(toJson());
}
