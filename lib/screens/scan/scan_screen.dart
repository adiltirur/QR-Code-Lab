import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/const/colors.dart';
import '../../core/const/flavors.dart';
import '../../core/extensions/build_context.dart';
import '../../core/extensions/list.dart';
import '../../core/hooks/camera_controller_hook.dart';
import '../../core/routes/router.dart';
import '../../core/services/bloc.dart';
import '../../core/ui/components/bar_code_overlay.dart';
import '../../core/ui/components/bloc_master.dart';
import 'error.dart';
import 'scan_bloc.dart';
import 'scan_state.dart';

typedef _BlocOutput = WBBlocOutput<ScanState, ScanEvent>;

enum CameraControls {
  flash(icon: Icons.flash_on),
  camera(icon: Icons.switch_camera);

  final IconData icon;

  const CameraControls({required this.icon});
}

class ScanScreen extends HookWidget {
  Widget _buildCameraControl(
    BuildContext context,
    CameraControls cameraControlItem,
    MobileScannerController scannerController,
  ) {
    return Container(
      decoration:
          const BoxDecoration(color: WBColors.black, shape: BoxShape.circle),
      child: IconButton(
        onPressed: () {
          switch (cameraControlItem) {
            case CameraControls.flash:
              scannerController.toggleTorch();
              break;
            case CameraControls.camera:
              scannerController.switchCamera();
              break;
          }
        },
        icon: Icon(
          cameraControlItem.icon,
          color: WBColors.white,
        ),
      ),
    );
  }

  void _buildDebugPrint(String error) {
    if (F.appFlavor == Flavor.dev) debugPrint(error);
  }

  Rect _scanWindow(BuildContext context) {
    return Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200,
      height: 200,
    );
  }

  Widget _blocBuilder(
    BuildContext context,
    _BlocOutput output,
    MobileScannerController mobileScannerController,
  ) {
    return Builder(
      builder: (context) {
        final barcode = output.state.barcode;
        final arguments = output.state.arguments;
        final capture = output.state.capture;
        return Stack(
          fit: StackFit.expand,
          children: [
            MobileScanner(
              scanWindow: _scanWindow(context),
              controller: mobileScannerController,
              onScannerStarted: (arguments) {
                if (arguments != null)
                  context.bloc<ScanBloc>().onScanStart(arguments);
              },
              onDetect: (barcode) {
                final extractedBarcode = barcode.barcodes.tryFirst;
                if (extractedBarcode != null) {
                  context.bloc<ScanBloc>().onBarCodeDetect(barcode);
                }
              },
              errorBuilder: (_, error, __) {
                final errorDetails = error.errorDetails;
                if (errorDetails != null)
                  _buildDebugPrint(errorDetails.message);
                return ScannerErrorWidget(error: error);
              },
            ),
            if (barcode != null && barcode.corners != null && arguments != null)
              CustomPaint(
                painter: BarcodeOverlay(
                  barcode: barcode,
                  arguments: arguments,
                  boxFit: BoxFit.contain,
                  capture: capture!,
                ),
              ),
/*             CustomPaint(
              painter: ScannerOverlay(scanWindow),
            ), */
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCameraControl(
                      context,
                      CameraControls.flash,
                      mobileScannerController,
                    ),
                    _buildCameraControl(
                      context,
                      CameraControls.camera,
                      mobileScannerController,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleDetected(
    BuildContext context,
    MobileScannerController scannerController,
  ) async {
    scannerController.stop();
    final shouldResumeCamera =
        await context.router.push(const ScanDetailsRoute());
    if (shouldResumeCamera is bool) if (shouldResumeCamera)
      scannerController.start();
  }

  void _blocListener(
    BuildContext context,
    _BlocOutput output,
    MobileScannerController scannerController,
  ) {
    for (final event in output.events) {
      event.when<void>(
        detected: () => _handleDetected(
          context,
          scannerController,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobileScannerController = useMobileScannerController(
      torchEnabled: false,
      cameraFacing: CameraFacing.back,
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
