import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

MobileScannerController useMobileScannerController({
  required bool torchEnabled,
  required CameraFacing cameraFacing,
  required bool saveImage,
}) {
  return use(
    _MobileScannerControllerHook(
      torchEnabled: torchEnabled,
      cameraFacing: cameraFacing,
      saveImage: saveImage,
    ),
  );
}

class _MobileScannerControllerHook extends Hook<MobileScannerController> {
  const _MobileScannerControllerHook({
    required this.torchEnabled,
    required this.cameraFacing,
    required this.saveImage,
  });

  final bool torchEnabled;
  final bool saveImage;
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
      returnImage: hook.saveImage,
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
