import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rotation_app/core/mixin/permission.dart';

import 'package:rotation_app/features/task_list_map/flutter_map.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/icons.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/router/app_router.dart' as router;

abstract class FlutterMapModel extends ConsumerState<CustomFlutterMap> with PermissionMixin, TickerProviderStateMixin {
  final ValueNotifier<bool> isMapLoading = ValueNotifier(true);

  List<Marker> markers = [];

  List<Task>? tasks;
  LatLng currentLocation = const LatLng(0.0, 0.0);

  AnimatedMapController? animatedMapController;
  ValueNotifier<bool> infoWindowVisible = ValueNotifier(false);
  ValueNotifier<Task?> selectedTask = ValueNotifier(null);

  @override
  void initState() {
    animatedMapController = AnimatedMapController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addCurrentLocation();
      _setMarkers();
    });
    super.initState();
  }

  @override
  void dispose() {
    animatedMapController?.dispose();
    super.dispose();
  }

  Future<void> _addCurrentLocation() async {
    Position? position = await getLocation();

    if (position != null) {
      currentLocation = LatLng(position.latitude, position.longitude);
      isMapLoading.value = false;
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(position.latitude, position.longitude),
          child: const Icon(
            IconsData.markerIcon,
            color: ColorData.green,
            size: 40.0,
          ),
        ),
      );
    }
  }

  void _setMarkers() async {
    if (tasks == null) {
      return;
    }
    for (var task in tasks!) {
      double lat = double.tryParse(task.lat.toString())!;
      double lng = double.tryParse(task.lng.toString())!;
      markers.add(
        Marker(
          rotate: true,
          width: 80.0,
          height: 80.0,
          point: LatLng(lat, lng),
          child: GestureDetector(
            onTap: () {
              currentLocation = LatLng(lat, lng);
              updateCameraPosition();
              selectedTask.value = task;
              infoWindowVisible.value = true;
            },
            child: const Icon(
              IconsData.markerIcon,
              color: ColorData.red,
              size: 40.0,
            ),
          ),
        ),
      );
    }
  }

  bool check(value1, value2) {
    return value1 && value2 != null;
  }

  void updateCameraPosition() {
    animatedMapController?.animateTo(dest: currentLocation);
  }

  void detailPressed() {
    context.router.push(router.TaskDetailPage(task: selectedTask.value!));
  }

  void mapOnTap(TapPosition? tapPosition, LatLng? point) {
    infoWindowVisible.value = false;
  }
}
