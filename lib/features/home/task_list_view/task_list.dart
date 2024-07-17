import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/core/provider/base_notifier.dart';
import 'package:rotation_app/features/home/task_list_view/task_list_model.dart';
import 'package:rotation_app/features/home/task_list_view/widgets/card.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

class TaskList extends ConsumerStatefulWidget {
  const TaskList({super.key});

  @override
  ConsumerState<TaskList> createState() => _TaskListState();
}

class _TaskListState extends TaskListModel {
  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    taskList = ref.watch(NotifierManager.instance.task.notifier).taskList;
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        String? title = taskList[index].title;
        String? description = taskList[index].description;
        String? distance = taskList[index].distance.toString().kmOrM;

        String address = '${taskList[index].city} - ${taskList[index].address}';
        return CardTask(
          title: title,
          description: description,
          distance: distance,
          address: address,
          task: taskList[index],
        );
      },
    );
  }
}
