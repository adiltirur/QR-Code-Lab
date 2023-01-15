import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'language.dart';
part 'system_settings.freezed.dart';

@freezed
class SystemSettings with _$SystemSettings {
  const factory SystemSettings({
    required CameraFacing defaultCamera,
    required bool shouldSaveImage,
    required String? languageCode,
  }) = _SystemSettings;
}
