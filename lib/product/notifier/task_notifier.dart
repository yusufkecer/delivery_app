import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/date_extension.dart';
import 'package:rotation_app/core/extension/list_sort_multi_value.dart';
import 'package:rotation_app/product/repo/task_repo/task_repo.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

part 'task_notifier.g.dart';

@riverpod
class TaskNotifier extends _$TaskNotifier {
  final TaskRepo _taskRepo = TaskRepo();
  bool ongoingTask = false;

  @override
  List<Task> build() => [];

  List<Task> get taskList => state;

  Future<Map> updateTask(String id, Map<String, dynamic> body, bool isCancel) async {
    updateTaskStatus(isCancel, id);

    Map data = await _taskRepo.update(body, id);

    state = [...state.sortTask];

    return data;
  }

  Future<void> getTask() async {
    List<Task> taskList = await _taskRepo.get();

    state = taskList;

    checkTaskStatus();
  }

  void checkTaskStatus() {
    for (var element in state) {
      if (element.taskStatus == TaskStatus.inProgress) {
        ongoingTask = true;
        break;
      }
    }
  }

  void removeTask(Task task) {
    state = state..remove(task);
  }

  void updateTaskStatus(bool isCancel, String id) {
    if (!isCancel) {
      state = state.map((element) {
        if (element.id == id) {
          element = element.copyWith(
            taskStatus: TaskStatus.inProgress,
            startAt: DateTime.now().formattedDate,
          );
        }
        return element;
      }).toList();
    } else {
      state = state.map((element) {
        if (element.id == id) {
          element = element.copyWith(
            taskStatus: TaskStatus.notStarted,
            startAt: "",
          );
        }
        return element;
      }).toList();
      ongoingTask = false;
    }
  }
}
