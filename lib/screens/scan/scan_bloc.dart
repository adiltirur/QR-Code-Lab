import 'package:hive/hive.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/error/scanner_error.dart';
import '../../core/extensions/list.dart';
import '../../core/services/bloc.dart';
import '../../repository/scanner/models/hive_scanned_item.dart';
import '../../repository/scanner/scanner_repository.dart';
import 'scan_state.dart';

class ScanBloc extends WBBloc<ScanState, ScanEvent> {
  final _scannerRepository = ScannerRepository();

  void resumeScanning() {
    emitS(
      state: currentState.copyWith(
        barcode: null,
        capture: null,
        arguments: null,
      ),
    );
  }

  void onBarCodeDetect(BarcodeCapture barcode, bool saveImage) {
    emitS(isLoading: true);
    final extractedBarCode = barcode.barcodes.tryFirst;
    if (extractedBarCode != null) {
      executeSafely(
        () async {
          final scannedInfo = await _scannerRepository.getScannedInfo(
            extractedBarCode,
            saveImage ? barcode.image : null,
          );
          return scannedInfo;
        },
      ).then(
        (value) {
          if (value != null)
            emitS(
              isLoading: false,
              state: currentState.copyWith(
                barcode: extractedBarCode,
                capture: barcode,
              ),
              events: [
                ScanEvent.detected(
                  scannedInfo: value,
                ),
              ],
            );
        },
      );
    }
  }

  Future<void> onDeleteItem(String uuid) async {
    emitS(isLoading: true);
    final box = await Hive.openBox<HiveScannedItem>('scanHistory');
    box.delete(uuid);
    emitS(
      isLoading: false,
    );
  }

  void onScanStart(MobileScannerArguments arguments) {
    emitS(
      state: currentState.copyWith(
        arguments: arguments,
      ),
    );
  }

  void _tryToggleCamera() {
    emitS(
      events: [
        const ScanEvent.toggleCamera(),
      ],
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

  ScanBloc()
      : super(
          const ScanState(
            barcode: null,
            arguments: null,
            capture: null,
          ),
        );
}
