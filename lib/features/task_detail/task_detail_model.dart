import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/mixin/start_task.dart';
import 'package:rotation_app/features/task_detail/task_detail.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/router/app_router.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

abstract class TaskDetailModel extends ConsumerState<TaskDetail> with DialogUtil, StartTask {
  TaskNotifier? taskNotifier;
  String buttonText = StringData.startTask;
  void Function()? fun;
  void startPressed() async {
    await checkValues(widget.task, taskNotifier);
  }

  @override
  void initState() {
    checkTaskStatus(widget.task);
    super.initState();
  }

  void openMap() {
    context.router.push(MapRoutePage(task: widget.task));
  }

  void checkTaskStatus(Task task) {
    if (task.taskStatus == TaskStatus.inProgress) {
      fun = openMap;
      buttonText = StringData.navigation;
    } else {
      fun = startPressed;
      buttonText = StringData.startTask;
    }
  }
}
