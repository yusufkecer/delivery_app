import 'package:rotation_app/product/util/models/task_model/task_model.dart';

extension TaskSortMultiValue on List<Task> {
  List<Task> get sortTask {
    sort((a, b) {
      if (a.isCompleted! && !b.isCompleted!) {
        return 1;
      } else if (!a.isCompleted! && b.isCompleted!) {
        return -1;
      }

      int startAtComparison = b.startAt!.compareTo(a.startAt!);

      if (startAtComparison != 0) {
        return startAtComparison;
      }

      return a.distance!.compareTo(b.distance!);
    });

    return this;
  }
}
