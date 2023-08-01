import 'errors.dart';

class CreationError extends GSAlertError {
  final String exception;

  @override
  String get userMessage => exception;

  const CreationError(this.exception);
}
