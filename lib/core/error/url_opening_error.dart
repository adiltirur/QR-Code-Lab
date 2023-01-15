import 'errors.dart';

class UrlOpeningError extends WBAlertError {
  final String exception;

  @override
  String get userMessage => exception;

  const UrlOpeningError(this.exception);
}
