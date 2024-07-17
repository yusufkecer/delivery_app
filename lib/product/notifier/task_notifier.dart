import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/product/repo/task_repo/task_repo.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  final TaskRepo _taskRepo = TaskRepo();
  bool ongoingTask = false;
  List<Task> get taskList => state;

  void addTask(Task task) {
    taskList.add(task);
  }

  Future<void> getTask() async {
    List<Task> taskList = await _taskRepo.get();
    checkTaskStatus();
    state = taskList;
  }

  void checkTaskStatus() {
    for (var element in taskList) {
      if (element.taskStatus == TaskStatus.inProgress) {
        ongoingTask = true;
      }
    }
  }

  void removeTask(Task task) {
    taskList.remove(task);
  }

  TaskNotifier() : super([]);
}
