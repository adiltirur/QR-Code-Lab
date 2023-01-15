import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'errors.dart';

class ScannerError extends WBAlertError {
  final MobileScannerException exception;

  @override
  String get userMessage {
    switch (exception.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        return tr('scanner_controller_not_ready');

      case MobileScannerErrorCode.permissionDenied:
        return tr('general.error.permission_denied');

      default:
        return tr('general.error.unknown');
    }
  }

  const ScannerError(this.exception);
}
