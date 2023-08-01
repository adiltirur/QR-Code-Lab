import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../const/colors.dart';

part 'notification.freezed.dart';

enum GSNotificationType {
  info(
    backgroundColor: GSColors.info,
    icon: Icons.info,
  ),
  warning(
    backgroundColor: GSColors.warning,
    icon: Icons.warning,
  ),
  confirmation(
    backgroundColor: GSColors.success,
    icon: Icons.check,
  ),
  error(
    backgroundColor: GSColors.error,
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
