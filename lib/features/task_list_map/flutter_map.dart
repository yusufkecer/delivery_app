import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/features/task_list_map/flutter_map_model.dart';
import 'package:rotation_app/features/task_list_map/widgets/task_info_window.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/loading/lottie_loading.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/flutter_map/flutter_map_widget.dart';

class CustomFlutterMap extends ConsumerStatefulWidget {
  const CustomFlutterMap({super.key});

  @override
  ConsumerState<CustomFlutterMap> createState() => _CustomFlutterMapState();
}

class _CustomFlutterMapState extends FlutterMapModel {
  @override
  Widget build(BuildContext context) {
    TaskNotifier? task = ref.watch(taskNotifierProvider.notifier);
    tasks = task?.taskList;

    return ValueListenableBuilder(
      valueListenable: isMapLoading,
      builder: (context, value, child) {
        return !value ? flutterMap(value) : const LottieLoading();
      },
    );
  }

  FlutterMapWidget flutterMap(val) {
    return FlutterMapWidget(
      animatedMapController: animatedMapController,
      markers: markers,
      currentLocation: currentLocation,
      onTap: mapOnTap,
      cardLayer: visibleListener(),
    );
  }

  ValueListenableBuilder<bool> visibleListener() {
    return ValueListenableBuilder(
      valueListenable: infoWindowVisible,
      builder: (context, value, child) {
        return check(value, selectedTask.value) ? taskListenable() : const SizedBox.shrink();
      },
    );
  }

  ValueListenableBuilder<Task?> taskListenable() {
    return ValueListenableBuilder(
      valueListenable: selectedTask,
      builder: (context, value, child) => TaskInfoWindow(
        task: selectedTask.value!,
        detailPressed: detailPressed,
      ),
    );
  }
}
