import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

MobileScannerController useMobileScannerController({
  required bool torchEnabled,
  required CameraFacing cameraFacing,
}) {
  return use(
    _MobileScannerControllerHook(
        torchEnabled: torchEnabled, cameraFacing: cameraFacing),
  );
}

class _MobileScannerControllerHook extends Hook<MobileScannerController> {
  const _MobileScannerControllerHook({
    required this.torchEnabled,
    required this.cameraFacing,
  });

  final bool torchEnabled;
  final CameraFacing cameraFacing;

  @override
  HookState<MobileScannerController, Hook<MobileScannerController>>
      createState() => _MobileScannerControllerHookState();
}

class _MobileScannerControllerHookState
    extends HookState<MobileScannerController, _MobileScannerControllerHook> {
  late final MobileScannerController _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = MobileScannerController(
      facing: hook.cameraFacing,
      torchEnabled: hook.torchEnabled,
      detectionSpeed: DetectionSpeed.noDuplicates,
      detectionTimeoutMs: 1000,
      returnImage: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  MobileScannerController build(BuildContext context) => _controller;

  @override
  String get debugLabel => 'useMobileScannerController';
}
