import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/date_extension.dart';
import 'package:rotation_app/core/mixin/launch_mixin.dart';
import 'package:rotation_app/features/home/task_list_view/task_list.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

abstract class TaskListModel extends ConsumerState<TaskList> with DialogUtil, LaunchMixin {
  List<Task> taskList = [];
  TaskNotifier? taskNotifier;
  Future<void> navigationPressed(index) async {
    Task task = taskList[index];
    if (taskNotifier?.ongoingTask == true && task.taskStatus != TaskStatus.inProgress) {
      showErrorDialog(StringData.activeTaskError);
    }
    String formattedDate = DateTime.now().formattedDate;

    Map<String, dynamic> body = {
      "startAt": formattedDate,
    };

    Map? status = await taskNotifier?.updateTask(task.id!, body, false);
    checkRespose(status);
  }

  void detailPressed() {}

  void callButton() async {
    Task task = taskList.first;
    Map<String, dynamic> body = {
      "startAt": "",
    };

    Map? status = await taskNotifier?.updateTask(task.id!, body, true);
    checkRespose(status);
    launchPhone("tel", "05555555555");
  }

  void checkRespose(Map? status) {
    if (status?["status"] == "error") {
      showGeneralError();
    }
  }
}
