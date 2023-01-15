import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_scanned_item.g.dart';

@HiveType(typeId: 1)
class HiveScannedItem extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  Uint8List? qrCode;
  @HiveField(2)
  String? rawValue;
  @HiveField(3)
  String? displayValue;
  @HiveField(6)
  late DateTime createdAt;
  @HiveField(7)
  late DateTime modifiedAt;
  @HiveField(8)
  late String customName;
}
