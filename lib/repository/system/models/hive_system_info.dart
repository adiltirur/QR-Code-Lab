import 'package:hive/hive.dart';

part 'hive_system_info.g.dart';

@HiveType(typeId: 2)
class HiveSystemInfo {
  @HiveField(0)
  String? languageCode;
  @HiveField(1)
  late String cameraFacing;
  @HiveField(2)
  late bool shouldSaveImage;
}
