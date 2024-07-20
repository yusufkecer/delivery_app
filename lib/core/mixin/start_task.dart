import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/date_extension.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

mixin StartTask on DialogUtil {
  Future<void> startTask(Task task, TaskNotifier? taskNotifier) async {
    String formattedDate = DateTime.now().formattedDate;

    Map<String, dynamic> body = {
      "startAt": formattedDate,
    };

    Map? status = await taskNotifier?.updateTask(task.id!, body, false);
    checkRespose(status);
  }

  Future<void> checkValues(Task task, TaskNotifier? taskNotifier) async {
    if (task.taskStatus == TaskStatus.inProgress) {
      navigateToMap();
    } else if (taskNotifier?.ongoingTask != true) {
      await startTask(task, taskNotifier);
    } else {
      showErrorDialog(StringData.activeTaskError);
    }
  }

  void checkRespose(Map? status) {
    if (status?["status"] == "error") {
      showGeneralError();
    }
  }

  void navigateToMap() {
    // navigate to map
  }
}
