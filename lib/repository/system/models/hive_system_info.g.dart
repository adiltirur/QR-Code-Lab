// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_system_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSystemInfoAdapter extends TypeAdapter<HiveSystemInfo> {
  @override
  final int typeId = 2;

  @override
  HiveSystemInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSystemInfo()
      ..languageCode = fields[0] as String?
      ..cameraFacing = fields[1] as String
      ..isDarkMode = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, HiveSystemInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.languageCode)
      ..writeByte(1)
      ..write(obj.cameraFacing)
      ..writeByte(2)
      ..write(obj.isDarkMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSystemInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
