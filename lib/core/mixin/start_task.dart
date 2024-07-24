import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/date_extension.dart';
import 'package:rotation_app/core/extension/navigation_extension.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/router/app_router.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog_util.dart';
import 'package:rotation_app/product/util/global/route_settings.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

mixin StartTask on DialogUtil {
  Future<void> startTask(Task task, TaskNotifier? taskNotifier) async {
    String formattedDate = DateTime.now().formattedDate;

    Map<String, dynamic> body = {
      "startAt": formattedDate,
    };

    Map? status = await taskNotifier?.updateTask(task.id!, body);
    checkRespose(status);
  }

  Future<void> checkValues(Task task, TaskNotifier? taskNotifier) async {
    if (task.taskStatus == TaskStatus.inProgress) {
      navigateToMap(task);
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

  void navigateToMap(Task task) {
    BuildContext context = RoutingSettings.instance.currentContext!;
    context.router.push(MapRoutePage(task: task));
  }
}
