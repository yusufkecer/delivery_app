import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/core/provider/base_notifier.dart';
import 'package:rotation_app/features/home/task_list_view/task_list_model.dart';
import 'package:rotation_app/features/home/task_list_view/widgets/card.dart';
import 'package:rotation_app/product/util/constants/icons.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';

import 'package:rotation_app/product/util/models/task_model/task_model.dart';

class TaskList extends ConsumerStatefulWidget {
  const TaskList({super.key});

  @override
  ConsumerState<TaskList> createState() => _TaskListState();
}

class _TaskListState extends TaskListModel {
  @override
  Widget build(BuildContext context) {
    taskList = ref.watch(NotifierManager.instance.task);
    taskNotifier = ref.read(NotifierManager.instance.task.notifier);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: callButton,
        tooltip: StringData.callManager,
        child: const Icon(IconsData.phone),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          String? title = taskList[index].title;
          String? description = taskList[index].description;
          String? distance = taskList[index].distance.toString().kmOrM;
          Task task = taskList[index];
          String address = '${taskList[index].city} - ${taskList[index].address}';
          return CardTask(
            title: title,
            description: description,
            distance: distance,
            address: address,
            task: task,
            navigationPressed: () {
              navigationPressed(taskList[index]);
            },
            detailPressed: () {
              detailPressed(taskList[index]);
            },
          );
        },
      ),
    );
  }
}
