abstract class GSError implements Exception {
  String? get debugLog => null;
  bool get canBeIgnored => false;
  bool get logToServer => true;
  String? get serverLog => debugLog;

  const GSError();
}

abstract class GSAlertError extends GSError {
  String get userMessage;

  const GSAlertError();
}
