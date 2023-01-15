import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/const/colors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/hooks/camera_controller_hook.dart';
import '../../core/models/scanned_info.dart';
import '../../core/models/system_settings.dart';
import '../../core/routes/router.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bar_code_overlay.dart';
import '../../core/ui/components/bloc_master.dart';
import 'scan_bloc.dart';
import 'scan_state.dart';

typedef _BlocOutput = WBBlocOutput<ScanState, ScanEvent>;

enum _CameraControls {
  torch(icon: Icons.flash_on),
  switchCamera(icon: Icons.cameraswitch);

  final IconData icon;

  const _CameraControls({
    required this.icon,
  });
}

extension on _CameraControls {
  Future<void> onTap(MobileScannerController controller) {
    switch (this) {
      case _CameraControls.torch:
        return controller.toggleTorch();
      case _CameraControls.switchCamera:
        return controller.switchCamera();
    }
  }
}

extension on TorchState {
  IconData get displayIcon {
    switch (this) {
      case TorchState.off:
        return _CameraControls.torch.icon;
      case TorchState.on:
        return Icons.flash_off;
    }
  }
}

Widget _buildCameraIcon(
  _CameraControls cameraControlItem,
) {
  return Icon(
    cameraControlItem.icon,
    color: WBColors.white,
  );
}

Widget _buildTorchIcon(
  MobileScannerController scannerController,
) {
  return ValueListenableBuilder(
    valueListenable: scannerController.torchState,
    builder: (_, state, __) => Icon(
      state.displayIcon,
      color: WBColors.white,
    ),
  );
}

extension on _CameraControls {
  Widget displayIcon(
    MobileScannerController controller,
  ) {
    switch (this) {
      case _CameraControls.torch:
        return _buildTorchIcon(controller);
      case _CameraControls.switchCamera:
        return _buildCameraIcon(this);
    }
  }
}

class ScanScreen extends HookWidget {
  final SystemSettings systemSettings;

  const ScanScreen({required this.systemSettings});
  Widget _buildCameraControl(
    BuildContext context,
    _CameraControls cameraControlItem,
    MobileScannerController scannerController,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: WBColors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => cameraControlItem.onTap(scannerController),
        icon: cameraControlItem.displayIcon(scannerController),
      ),
    );
  }

  Widget _buildControls(
    BuildContext context,
    MobileScannerController mobileScannerController,
  ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCameraControl(
              context,
              _CameraControls.torch,
              mobileScannerController,
            ),
            _buildCameraControl(
              context,
              _CameraControls.switchCamera,
              mobileScannerController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverlay(Rect scanWindow) {
    return CustomPaint(
      painter: ScannerOverlay(scanWindow),
    );
  }

  Widget _buildDetectedArea(
    Barcode barcode,
    MobileScannerArguments arguments,
    BarcodeCapture capture,
  ) {
    return CustomPaint(
      painter: BarcodeOverlay(
        barcode: barcode,
        arguments: arguments,
        boxFit: BoxFit.contain,
        capture: capture,
      ),
    );
  }

  Widget _buildQRCodeScanner(
    BuildContext context,
    MobileScannerController mobileScannerController,
    Rect scanWindow,
  ) {
    final bloc = context.bloc<ScanBloc>();
    return MobileScanner(
      scanWindow: scanWindow,
      controller: mobileScannerController,
      onScannerStarted: (arguments) {
        if (arguments != null) bloc.onScanStart(arguments);
      },
      onDetect: (barcode) {
        bloc.onBarCodeDetect(barcode, systemSettings.shouldSaveImage);
      },
      errorBuilder: (_, error, __) {
        bloc.onErrorDetected(error);
        return const SizedBox.shrink();
      },
    );
  }

  Rect _scanWindow(BuildContext context) {
    const scanWindowWidth = 240.0;
    const scanWindowHeight = 240.0;
    return Rect.fromCenter(
      center: MediaQuery.of(context).size.center(
            const Offset(0, -50),
          ),
      width: scanWindowWidth,
      height: scanWindowHeight,
    );
  }

  Widget _blocBuilder(
    BuildContext context,
    _BlocOutput output,
    MobileScannerController mobileScannerController,
  ) {
    final state = output.state;
    final barcode = state.barcode;
    final arguments = state.arguments;
    final capture = state.capture;
    final scanWindow = _scanWindow(context);
    final shouldBuildDetectedArea = barcode != null &&
        barcode.corners != null &&
        arguments != null &&
        capture != null;

    return Builder(
      builder: (context) {
        return Stack(
          fit: StackFit.expand,
          children: [
            _buildQRCodeScanner(context, mobileScannerController, scanWindow),
            if (shouldBuildDetectedArea)
              _buildDetectedArea(barcode, arguments, capture),
            _buildOverlay(scanWindow),
            _buildControls(context, mobileScannerController),
          ],
        );
      },
    );
  }

  void _handleOnBack(
    BuildContext context,
    MobileScannerController scannerController,
  ) {
    context.router.pop();
    scannerController.start();
  }

  Future<void> _handleDetected(
    BuildContext context,
    MobileScannerController scannerController,
    ScannedInfo scannedInfo,
  ) async {
    scannerController.stop();
    var bloc = context.bloc<ScanBloc>();
    context.router.push(
      ScanDetailsRoute(
        scannedInfo: scannedInfo,
        onDelete: bloc.onDeleteItem,
        onBack: bloc.onBackFromDetailsPage,
      ),
    );
  }

  void _blocListener(
    BuildContext context,
    _BlocOutput output,
    MobileScannerController scannerController,
  ) {
    for (final event in output.events) {
      event.when<void>(
        detected: (scannedInfo) => _handleDetected(
          context,
          scannerController,
          scannedInfo,
        ),
        toggleCamera: () => scannerController.switchCamera(),
        onBack: () => _handleOnBack(context, scannerController),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobileScannerController = useMobileScannerController(
      torchEnabled: false,
      cameraFacing: systemSettings.defaultCamera,
      saveImage: systemSettings.shouldSaveImage,
    );

    return Scaffold(
      body: BlocMaster<ScanBloc, _BlocOutput>(
        create: (_) => ScanBloc(),
        builder: (context, output) =>
            _blocBuilder(context, output, mobileScannerController),
        listener: (context, output) =>
            _blocListener(context, output, mobileScannerController),
        useScreenLoader: true,
      ),
    );
  }
}
