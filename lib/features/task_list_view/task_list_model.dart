import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/enum/task_status.dart';

import 'package:rotation_app/core/mixin/launch_mixin.dart';
import 'package:rotation_app/core/mixin/start_task.dart';
import 'package:rotation_app/features/task_list_view/task_list.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/dialog/dialog_util.dart';

import 'package:rotation_app/product/util/models/task_model/task_model.dart';

import 'package:rotation_app/product/router/app_router.dart' as router;

abstract class TaskListModel extends ConsumerState<TaskList> with LaunchMixin, DialogUtil, StartTask {
  List<Task> taskList = [];
  TaskNotifier? taskNotifier;
  Future<void> navigationPressed(Task task) async {
    await checkValues(task, taskNotifier);
  }

  void detailPressed(Task task) {
    context.router.push(router.TaskDetailPage(task: task));
  }

  void callButton() async {
    Task task = taskList.first;
    Map<String, dynamic> body = {
      "startAt": "",
    };

    Map? status = await taskNotifier?.updateTask(task.id!, body, status: TaskStatus.inProgress);
    checkRespose(status);
    launchPhone("tel", "05555555555");
  }
}
