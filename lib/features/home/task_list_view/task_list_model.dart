import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/features/home/task_list_view/task_list.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

abstract class TaskListModel extends ConsumerState<TaskList> with DialogUtil {
  List<Task> taskList = [];
  TaskNotifier? taskNotifier;

  void navigationPressed(index) {
    if (!(taskNotifier?.ongoingTask == true && taskList[index].taskStatus == TaskStatus.inProgress)) {
      showErrorDialog(StringData.activeTaskError);
    }
  }

  void detailPressed() {}
}
