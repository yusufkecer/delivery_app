import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/product/repo/task_repo/base_repo.dart';
import 'package:rotation_app/product/service/api/api_service.dart';
import 'package:rotation_app/product/service/api/api_url.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

class TaskRepo implements BaseRepo {
  final ApiService _apiService = ApiService();
  String endPoint = ApiUrl.taks;
  @override
  Future<void> create(Map<String, dynamic> body) async {
    await _apiService.create(endPoint, body);
  }

  @override
  Future<void> delete() async {
    await _apiService.delete(endPoint);
  }

  @override
  Future<List<Task>> get() async {
    List data = await _apiService.get(endPoint);
    List<Task> taskList = data.map((e) => Task.fromJson(e)).toList();

    setValues(taskList);

    taskList.sort((a, b) => a.distance!.compareTo(b.distance!));
    taskList[0].taskStatus = TaskStatus.inProgress;
    taskList[3].taskStatus = TaskStatus.completed;
    return taskList;
  }

  @override
  Future<void> update(Map<String, dynamic> body) async {
    await _apiService.update(endPoint, body);
  }

  void setValues(List<Task> taskList) {
    for (var task in taskList) {
      if (task.isCompleted ?? false) {
        task.taskStatus = TaskStatus.completed;
      } else if (task.startAt?.isNotEmpty ?? false) {
        task.taskStatus = TaskStatus.inProgress;
      } else {
        task.taskStatus = TaskStatus.notStarted;
      }
    }
  }
}
