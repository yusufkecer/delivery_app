import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/core/provider/base_notifier.dart';
import 'package:rotation_app/features/home/home_view_model.dart';
import 'package:rotation_app/features/home/widgets/card.dart';
import 'package:rotation_app/features/home/widgets/flutter_map.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/loading/lottie_loading.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeState();
}

class _HomeState extends HomeModel {
  @override
  Widget build(BuildContext context) {
    task = ref.watch(NotifierManager.instance.task.notifier);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              title: const Text(StringData.myTasks),
              bottom: tabbar(context),
            ),
          ];
        },
        body: TabBarView(
          children: [
            taskBuilder(),
            const CustomFlutterMap(),
          ],
        ),
      )),
    );
  }

  ValueListenableBuilder<bool> taskBuilder() {
    return ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (context, value, child) {
          return !value ? taskListWidget() : const MyLoading();
        });
  }

  TabBar tabbar(BuildContext context) {
    return TabBar(
      indicatorColor: ColorData.white,
      labelStyle: context.textTheme.titleMedium?.copyWith(
        color: ColorData.white,
      ),
      tabs: tabsList,
    );
  }

  ListView taskListWidget() {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        String? title = taskList[index].title;
        String? description = taskList[index].description;
        String? distance = taskList[index].distance.toString().kmOrM;
        TaskStatus? taskStatus = taskList[index].taskStatus;
        String address = '${taskList[index].city} - ${taskList[index].address}';
        return CardTask(
          title: title,
          description: description,
          distance: distance,
          address: address,
          taskStatus: taskStatus,
        );
      },
    );
  }
}
