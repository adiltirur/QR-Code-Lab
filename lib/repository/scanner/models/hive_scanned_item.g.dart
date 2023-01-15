// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_scanned_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveScannedItemAdapter extends TypeAdapter<HiveScannedItem> {
  @override
  final int typeId = 1;

  @override
  HiveScannedItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveScannedItem()
      ..uuid = fields[0] as String
      ..qrCode = fields[1] as Uint8List?
      ..rawValue = fields[2] as String?
      ..displayValue = fields[3] as String?
      ..createdAt = fields[6] as DateTime
      ..modifiedAt = fields[7] as DateTime
      ..customName = fields[8] as String?
      ..note = fields[9] as String?;
  }

  @override
  void write(BinaryWriter writer, HiveScannedItem obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.qrCode)
      ..writeByte(2)
      ..write(obj.rawValue)
      ..writeByte(3)
      ..write(obj.displayValue)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.modifiedAt)
      ..writeByte(8)
      ..write(obj.customName)
      ..writeByte(9)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveScannedItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
