import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

enum GSNotificationType {
  info(
    backgroundColor: Colors.lightBlueAccent,
    icon: Icons.info,
  ),
  warning(
    backgroundColor: Colors.yellowAccent,
    icon: Icons.warning,
  ),
  confirmation(
    backgroundColor: Colors.green,
    icon: Icons.check,
  ),
  error(
    backgroundColor: Colors.red,
    icon: Icons.close,
  );

  final Color backgroundColor;
  final IconData icon;

  const GSNotificationType({
    required this.backgroundColor,
    required this.icon,
  });
}

@freezed
class GSNotification with _$GSNotification {
  const factory GSNotification({
    required GSNotificationType type,
    required String text,
  }) = _GSNotification;
}
