import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/list_sort_multi_value.dart';

import 'package:rotation_app/product/repo/base_repo.dart';
import 'package:rotation_app/product/service/api/api_service.dart';
import 'package:rotation_app/product/service/api/api_url.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

class TaskRepo implements BaseRepo<Task, Map<String, dynamic>> {
  final ApiService _apiService = ApiService();
  String endPoint = ApiUrl.taks;
  @override
  Future<void> create(Task body) async {
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

    taskList.sortTask;
    setValues(taskList);

    return taskList;
  }

  @override
  Future<Map> update(Map<String, dynamic> body, String id) async {
    Map data = await _apiService.update(endPoint, body, id);
    return data;
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
