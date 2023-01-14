import 'package:image/image.dart' as img;
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/error/scanner_error.dart';
import '../../core/extensions/list.dart';
import '../../core/services/bloc.dart';
import '../../repository/scanner/scanner_repository.dart';
import 'scan_state.dart';

class ScanBloc extends WBBloc<ScanState, ScanEvent> {
  final _scannerRepository = ScannerRepository();
  static const _maxFileSizeInBytes = 1 * 1024 * 1024;
  Future<List<int>?> _compress(List args) async {
    final srcImageData = args[0] as List<int>;
    final quality = args[1] as int;
    final src = img.decodeImage(srcImageData);
    if (src == null) return null;
    final destImageData = img.encodeJpg(src, quality: quality);
    return destImageData;
  }

  void onBarCodeDetect(
    BarcodeCapture barcode,
  ) {
    var quality = 100;
    emitS(isLoading: true);
    final extractedBarCode = barcode.barcodes.tryFirst;
    if (extractedBarCode != null) {
      executeSafely(() async {
        final scannedInfo = await _scannerRepository.getScannedInfo(
          extractedBarCode,
          barcode.image,
        );
        return scannedInfo;
      }).then((value) {
        if (value != null)
          emitS(
            isLoading: false,
            state: currentState.copyWith(
              barcode: extractedBarCode,
              capture: barcode,
            ),
            events: [
              ScanEvent.detected(scannedInfo: value),
            ],
          );
      });
    }
  }

  void onScanStart(MobileScannerArguments arguments) {
    emitS(
      state: currentState.copyWith(
        arguments: arguments,
      ),
    );
  }

  void onErrorDetected(MobileScannerException exception) {
    //below hardCoded error message is an open issue
    //with the MobileScanner Plugin
    //This is a temporary fix(work around) and should be reverted when
    //https://github.com/juliansteenbakker/mobile_scanner/issues/425 is fixed
    //Also this will happen only when hot reloading,
    //so in production the chances of this happening is less
    const errorMessage = 'Called start() while already started!';
    var errorDetails = exception.errorDetails;
    if (currentOutput.error == null) {
      if (errorDetails != null) if (errorDetails.message == errorMessage) {
        _tryToggleCamera();
      } else {
        emitS(
          error: ScannerError(exception),
        );
      }
    }
  }

  void _tryToggleCamera() {
    emitS(
      events: [
        const ScanEvent.toggleCamera(),
      ],
    );
  }

  ScanBloc()
      : super(
          const ScanState(
            barcode: null,
            arguments: null,
            capture: null,
          ),
        );
}
