import 'errors.dart';

class UrlOpeningError extends GSAlertError {
  final String exception;

  @override
  String get userMessage => exception;

  const UrlOpeningError(this.exception);
}
