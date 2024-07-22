import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/extension/logger_extension.dart';
import 'package:rotation_app/core/mixin/permission.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/constants/icons.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'home_view.dart';

abstract class HomeModel extends ConsumerState<HomeScreen> with PermissionMixin, DialogUtil, TickerProviderStateMixin {
  TaskNotifier? task;
  TabController? tabController;
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
    tabController = TabController(length: tabsList.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      isLoading.value = true;
      await getTasks();
      await requestPermission();
      isLoading.value = false;
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  Future<void> getTasks() async {
    if (task == null) {
      showGeneralError();
      return;
    }

    await task!.getTask();

    if (task!.taskList.isEmpty) {
      showGeneralError();
      return;
    }
    taskList = task!.taskList;

    "task fetched".info;
  }

  bool checkData() {
    return isLoading.value && taskList.isEmpty;
  }
}
