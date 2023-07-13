import 'package:hive/hive.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/const/hive_boxes.dart';
import '../../core/models/system_settings.dart';
import 'models/hive_system_info.dart';

class SystemRepository {
  Future<void> saveSystemInfo(SystemSettings systemSettings) async {
    final box = await Hive.openBox<HiveSystemInfo>(GSHiveNames.systemSettings);

    final hiveSystemInfo = HiveSystemInfo()
      ..cameraFacing = systemSettings.defaultCamera.name
      ..languageCode = systemSettings.languageCode
      ..shouldSaveImage = systemSettings.shouldSaveImage;
    await box.put(
      GSHiveNames.settingsId,
      hiveSystemInfo,
    );
  }

  Future<SystemSettings?> getSystemInfo() async {
    final box = await Hive.openBox<HiveSystemInfo>(GSHiveNames.systemSettings);

    final hiveSystemInfo = box.get(GSHiveNames.settingsId);
    if (hiveSystemInfo != null) {
      const frontCameraEnumValue = 'front';
      final systemSettings = SystemSettings(
        defaultCamera: hiveSystemInfo.cameraFacing == frontCameraEnumValue
            ? CameraFacing.front
            : CameraFacing.back,
        shouldSaveImage: hiveSystemInfo.shouldSaveImage,
        languageCode: hiveSystemInfo.languageCode,
      );
      return systemSettings;
    }
    return null;
  }
}
