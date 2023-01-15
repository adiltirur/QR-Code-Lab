import 'package:hive/hive.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/models/system_settings.dart';
import 'models/hive_system_info.dart';

class SystemRepository {
  Future<void> saveSystemInfo(SystemSettings systemSettings) async {
    final box = await Hive.openBox<HiveSystemInfo>('systemSettings');

    final hiveSystemInfo = HiveSystemInfo()
      ..cameraFacing = systemSettings.defaultCamera.name
      ..languageCode = systemSettings.languageCode
      ..shouldSaveImage = systemSettings.shouldSaveImage;
    await box.put(
      'settings',
      hiveSystemInfo,
    );
  }

  Future<SystemSettings?> getSystemInfo() async {
    final box = await Hive.openBox<HiveSystemInfo>('systemSettings');

    final hiveSystemInfo = box.get('settings');
    if (hiveSystemInfo != null) {
      final systemSettings = SystemSettings(
        defaultCamera: hiveSystemInfo.cameraFacing == 'front'
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
