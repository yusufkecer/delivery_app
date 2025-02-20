import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/features/home/home_view_model.dart';
import 'package:rotation_app/features/home/widgets/custom_tabbar.dart';
import 'package:rotation_app/features/task_list_view/task_list.dart';
import 'package:rotation_app/features/task_list_map/flutter_map.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/loading/lottie_loading.dart';
import 'package:rotation_app/product/widgets/fault_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeState();
}

class _HomeState extends HomeModel {
  @override
  Widget build(BuildContext context) {
    task = ref.watch(taskNotifierProvider.notifier);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              title: const Text(StringData.myTasks),
              bottom: tabbar(),
            ),
          ];
        },
        body: !checkData()
            ? TabBarView(
                controller: tabController,
                children: [
                  taskBuilder(),
                  const CustomFlutterMap(),
                ],
              )
            : const FaultWidget(),
      ),
    );
  }

  ValueListenableBuilder<bool> taskBuilder() {
    return ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (context, value, child) {
          return !value ? const TaskList() : const LottieLoading();
        });
  }

  CustomTabbar tabbar() {
    return CustomTabbar(
      tabController: tabController,
      tabsList: tabsList,
    );
  }
}
