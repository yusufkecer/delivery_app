import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/mixin/permission.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/constants/icons.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'home_view.dart';

abstract class HomeModel extends ConsumerState<HomeScreen> with PermissionMixin, DialogUtil {
  TaskNotifier? task;

  List<Task> taskList = [];
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  List<Widget> tabsList = [
    const Tab(
      text: StringData.taskList,
      icon: Icon(
        IconsData.details,
      ),
    ),
    const Tab(
      text: StringData.map,
      icon: Icon(
        IconsData.map,
      ),
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await requestPermission();
      await getTasks();
    });

    super.initState();
  }

  Future<void> getTasks() async {
    if (task == null) {
      showGeneralError();
      return;
    }
    isLoading.value = true;
    await task!.getTask();
    isLoading.value = false;
    if (task!.taskList.isEmpty) {
      showGeneralError();
      return;
    }
    taskList = task!.taskList;
    logger.i('Tasks are fetched');
  }
}
