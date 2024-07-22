import 'package:logger/logger.dart';

extension LoggerExtension on dynamic {
  void logInfo(String message) {
    Logger().i(message);
  }

  void logError(String message) {
    Logger().e(message);
  }

  void logWarning(String message) {
    Logger().w(message);
  }
}
