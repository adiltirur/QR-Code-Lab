import 'package:json_annotation/json_annotation.dart';
import '../extensions/bad_key_exception.dart';

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

abstract class WBUnknownAlertError extends WBAlertError {
  @override
  String get debugLog;
//TODO: Add localization
  @override
  String get userMessage => 'Something gone wrong';

  const WBUnknownAlertError();
}

class WBDecodeError extends WBUnknownAlertError {
  final BadKeyException _badKeyException;

  @override
  String get debugLog => _badKeyException.toLogString();

  const WBDecodeError(this._badKeyException);
}

class WBDecodeTypeError extends WBUnknownAlertError {
  final TypeError _typeError;

  @override
  String get debugLog => _typeError.toString();

  const WBDecodeTypeError(this._typeError);
}

class WBUnexpectedNullError extends WBUnknownAlertError {
  final Object? _info;

  @override
  String get debugLog => _info?.toString() ?? '';

  const WBUnexpectedNullError([this._info]);
}
