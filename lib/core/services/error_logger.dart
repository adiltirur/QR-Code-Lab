import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../error/errors.dart';

class _FileOutput extends LogOutput {
  _FileOutput();

  @override
  Future<void> output(OutputEvent event) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/logs')..writeAsStringSync('');

      for (var line in event.lines) {
        await file.writeAsString('${line.toString()}\n',
            mode: FileMode.writeOnlyAppend);
      }
      debugPrint('Wrote log to ${file.path}');
    } catch (_) {}
  }
}

class ErrorLogger {
  static final shared = ErrorLogger._(
    Logger(
      printer: PrettyPrinter(
        errorMethodCount: 20,
        colors: false,
        printEmojis: false,
        printTime: true,
      ),
    ),
    Logger(
      printer: PrettyPrinter(
        errorMethodCount: 20,
        colors: false,
        printEmojis: false,
        printTime: true,
        noBoxingByDefault: true,
      ),
      output: _FileOutput(),
    ),
  );
  ErrorLogger._(this._logger, this._fileLogger);

  final Logger _logger;
  final Logger _fileLogger;

  String _getErrorType(Object error) {
    if (error is FlutterErrorDetails) {
      return error.exceptionAsString();
    }
    return error.runtimeType.toString();
  }

  String? _getErrorMessage(Object error, bool forServer) {
    if (error is WBError) {
      return forServer ? error.serverLog : error.debugLog;
    }
    if (error is FlutterErrorDetails) {
      return error.context?.toString();
    }
    return error.toString();
  }

  void _logToDebugConsole(Object error, StackTrace stackTrace) {
    final errorType = _getErrorType(error);
    final errorMessage = _getErrorMessage(error, false);

    _logger.e(errorType, errorMessage, stackTrace);
    _fileLogger.e(errorType, errorMessage, stackTrace);
  }

  void log(Object error, StackTrace stackTrace) {
    if (error is WBError && error.canBeIgnored) {
      return;
    }
    _logToDebugConsole(error, stackTrace);
  }
}
