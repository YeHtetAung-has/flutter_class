import 'dart:developer' as developer;

enum LogLevels { debug, info, warning, error }

class AppLogger {
  AppLogger._();

  static bool enabled = true;

  static void _log({
    required LogLevels level,
    required String message,
    required String tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!enabled) return;

    final logMessage = '[${level.name.toUpperCase()}][$tag] $message';

    developer.log(
      logMessage,
      name: 'FlutterApp',
      error: error,
      stackTrace: stackTrace,
    );
  }

  static void debug(String message, {String tag = 'AppLogger'}) {
    _log(level: LogLevels.debug, message: message, tag: tag);
  }

  static void info(String message, {String tag = 'AppLogger'}) {
    _log(level: LogLevels.info, message: message, tag: tag);
  }

  static void warning(String message, {String tag = 'AppLogger'}) {
    _log(level: LogLevels.warning, message: message, tag: tag);
  }

  static void error(
    String message, {
    String tag = 'AppLogger',
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      level: LogLevels.error,
      message: message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
