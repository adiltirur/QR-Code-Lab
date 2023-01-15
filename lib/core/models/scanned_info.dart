import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
part 'scanned_info.freezed.dart';

@freezed
class ScannedInfo with _$ScannedInfo {
  const factory ScannedInfo({
    required String uuid,
    @JsonKey(name: 'qr_code') required Uint8List? qrCode,
    @JsonKey(name: 'bar_code') required Barcode barCode,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'modified_at') required DateTime modifiedAt,
    @JsonKey(name: 'custom_name') required String? customName,
  }) = _ScannedInfo;
}
