import 'package:mobile_scanner/mobile_scanner.dart';

import 'errors.dart';

class ScannerError extends WBAlertError {
  final MobileScannerException exception;

  @override
  String get userMessage {
    switch (exception.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        return 'Controller not ready.';

      case MobileScannerErrorCode.permissionDenied:
        return 'Permission denied';

      default:
        return 'Generic Error';
    }
  }

  const ScannerError(this.exception);
}
