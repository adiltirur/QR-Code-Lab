import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/models/scanned_info.dart';

part 'scan_state.freezed.dart';

@freezed
class ScanEvent with _$ScanEvent {
  const factory ScanEvent.detected({
    required ScannedInfo scannedInfo,
  }) = ScanDetectedEvent;
  const factory ScanEvent.toggleCamera() = ScanToggleCameraEvent;
}

@freezed
class ScanState with _$ScanState {
  const factory ScanState({
    required Barcode? barcode,
    required MobileScannerArguments? arguments,
    required BarcodeCapture? capture,
  }) = _ScanState;
}
