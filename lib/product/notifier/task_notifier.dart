import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  final List<Task> _taskList = [];

  List<Task> get taskList => _taskList;

  void addTask(Task task) {
    taskList.add(task);
  }

  void removeTask(Task task) {
    taskList.remove(task);
  }

  TaskNotifier() : super([]);
}
