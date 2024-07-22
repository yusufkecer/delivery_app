import 'package:logger/logger.dart';

extension LoggerExtension on dynamic {
  dynamic get info => Logger().i(this);

  void logError(String message, [dynamic error]) {
    Logger().e(message, error: error);
  }

  dynamic get warning => Logger().w(this);

  dynamic get fatal => Logger().f(this);
}
