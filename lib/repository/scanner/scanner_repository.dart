import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:image/image.dart' as img;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:uuid/uuid.dart';

import '../../core/const/hive_boxes.dart';
import '../../core/models/scanned_info.dart';
import '../../core/services/error_logger.dart';
import 'models/hive_scanned_item.dart';

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

  Future<void> _saveScannedInfo(ScannedInfo scannedInfo) async {
    final box = await Hive.openBox<HiveScannedItem>(GSHiveNames.scanHistory);
    final barCode = scannedInfo.barCode;
    final scannedItem = HiveScannedItem()
      ..uuid = scannedInfo.uuid
      ..qrCode = scannedInfo.qrCode
      ..rawValue = barCode.rawValue
      ..displayValue = barCode.displayValue
      ..createdAt = scannedInfo.createdAt
      ..modifiedAt = scannedInfo.createdAt
      ..customName = scannedInfo.customName ?? '';
    await box.put(
      scannedInfo.uuid,
      scannedItem,
    );
  }

  Future<ScannedInfo> getScannedInfo(
    Barcode barCode,
    Uint8List? qrCode, {
    String? title,
  }) async {
    final uuid = const Uuid().v1();
    final compressedImage = await _compressImage(qrCode);

    final dateTime = DateTime.now();
    final scannedInfo = ScannedInfo(
      uuid: uuid,
      qrCode: compressedImage,
      barCode: barCode,
      createdAt: dateTime,
      modifiedAt: dateTime,
      customName: title,
    );
    _saveScannedInfo(scannedInfo);
    return scannedInfo;
  }

  ScannedInfo getScannedInfoFromHive(
    HiveScannedItem hiveScannedItem,
  ) {
    final scannedInfo = ScannedInfo(
      uuid: hiveScannedItem.uuid,
      qrCode: hiveScannedItem.qrCode,
      barCode: Barcode(
        rawValue: hiveScannedItem.rawValue,
        displayValue: hiveScannedItem.displayValue,
      ),
      createdAt: hiveScannedItem.createdAt,
      modifiedAt: hiveScannedItem.modifiedAt,
      customName: hiveScannedItem.customName,
    );
    return scannedInfo;
  }

  Future<void> deleteScanHistory() async {
    final box = await Hive.openBox<HiveScannedItem>(GSHiveNames.scanHistory);
    box.deleteFromDisk();
  }

  Future<List<HiveScannedItem>> deleteItem(String uuid) async {
    final box = await Hive.openBox<HiveScannedItem>(GSHiveNames.scanHistory);
    box.delete(uuid);
    return box.values.toList();
  }
}
