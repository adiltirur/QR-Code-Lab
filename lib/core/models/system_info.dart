class SystemInfo {
  static late final SystemInfo shared;

  final String appVersion;
  final String buildNumber;
  final String packageName;
  final String deviceModel;
  final String deviceOSName;
  final String deviceOSVersion;
  final bool isRealDevice;

  String get fullVersion => 'v$appVersion ($buildNumber)';

  const SystemInfo({
    required this.appVersion,
    required this.buildNumber,
    required this.packageName,
    required this.deviceModel,
    required this.deviceOSName,
    required this.deviceOSVersion,
    required this.isRealDevice,
  });
}
