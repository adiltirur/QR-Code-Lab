import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/extensions/list.dart';
import '../../core/services/bloc.dart';
import 'scan_state.dart';

class ScanBloc extends WBBloc<ScanState, ScanEvent> {
  void onBarCodeDetect(
    BarcodeCapture barcode,
  ) {
    emitS(
      state: currentState.copyWith(
        barcode: barcode.barcodes.tryFirst,
        capture: barcode,
      ),
      events: [
        const ScanEvent.detected(),
      ],
    );
  }

  void onScanStart(MobileScannerArguments arguments) {
    emitS(
      state: currentState.copyWith(
        arguments: arguments,
      ),
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
