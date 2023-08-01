import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'system_settings.freezed.dart';

@freezed
class SystemSettings with _$SystemSettings {
  const factory SystemSettings({
    required CameraFacing defaultCamera,
    required String? languageCode,
  }) = _SystemSettings;
}
