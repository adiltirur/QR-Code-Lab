import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:uuid/uuid.dart';

import '../../core/models/scanned_info.dart';
import '../../core/services/error_logger.dart';

class ScannerRepository {
  static const _maxFileSizeInBytes = 1 * 1024 * 1024;
  Future<List<int>?> _compress(List args) async {
    final srcImageData = args[0] as List<int>;
    final quality = args[1] as int;
    final src = img.decodeImage(srcImageData);
    if (src == null) return null;
    final destImageData = img.encodeJpg(src, quality: quality);
    return destImageData;
  }

  Future<Uint8List?> _compressImage(Uint8List? original) async {
    if (original != null) {
      try {
        var quality = 100;
        while (quality > 0) {
          final imageData = original.toList();
          final compressed = await compute(_compress, [imageData, quality]);
          if (compressed != null && compressed.length <= _maxFileSizeInBytes) {
            return Uint8List.fromList(compressed);
          }
          quality -= 25;
        }
      } catch (error, stackTrace) {
        ErrorLogger.shared.log(error, stackTrace);
      }
    } else {
      return null;
    }
    return null;
  }

  Future<ScannedInfo> getScannedInfo(Barcode barCode, Uint8List? qrCode) async {
    final uuid = const Uuid().v1();
    final compressedImage = await _compressImage(qrCode);

    final scannedInfo = ScannedInfo(
      uuid: uuid,
      qrCode: compressedImage,
      barCode: barCode,
      createdAt: DateTime.now(),
    );
    return scannedInfo;
  }
}
