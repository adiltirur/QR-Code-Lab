import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

enum WBNotificationType {
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

  const WBNotificationType({
    required this.backgroundColor,
    required this.icon,
  });
}

@freezed
class WBNotification with _$WBNotification {
  const factory WBNotification({
    required WBNotificationType type,
    required String text,
  }) = _WBNotification;
}
