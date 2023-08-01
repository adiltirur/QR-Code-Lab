import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/models/scanned_info.dart';

part 'create_qr_code_state.freezed.dart';

enum QRCodeItem { url, text, email, phone }

@freezed
class CreateQRCodeEvent with _$CreateQRCodeEvent {
  const factory CreateQRCodeEvent.created({
    required ScannedInfo scannedInfo,
  }) = CreateQRCodeCreatedEvent;
  const factory CreateQRCodeEvent.onBack() = CreateQRCodeOnBackEvent;
}

@freezed
class CreateQRCodeState with _$CreateQRCodeState {
  const factory CreateQRCodeState({
    required String? text,
    required QRCodeItem type,
  }) = _CreateQRCodeState;
}
