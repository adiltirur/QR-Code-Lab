abstract class WBError implements Exception {
  String? get debugLog => null;
  bool get canBeIgnored => false;
  bool get logToServer => true;
  String? get serverLog => debugLog;

  const WBError();
}

abstract class WBAlertError extends WBError {
  String get userMessage;

  const WBAlertError();
}
