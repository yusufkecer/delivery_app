import 'package:rotation_app/product/util/constants/string_data.dart';

enum TaskStatus {
  completed,
  inProgress,
  notStarted,
}

extension TaskStatusExtension on TaskStatus {
  String get value {
    switch (this) {
      case TaskStatus.completed:
        return StringData.completed;
      case TaskStatus.inProgress:
        return StringData.onProgress;
      case TaskStatus.notStarted:
        return StringData.notStarted;
    }
  }
}
