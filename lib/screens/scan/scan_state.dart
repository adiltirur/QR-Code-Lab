import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'scan_state.freezed.dart';

@freezed
class ScanEvent with _$ScanEvent {
  const factory ScanEvent.detected() = ScanDetectedEvent;
}

@freezed
class ScanState with _$ScanState {
  const factory ScanState({
    required Barcode? barcode,
    required MobileScannerArguments? arguments,
    required BarcodeCapture? capture,
  }) = _ScanState;
}
