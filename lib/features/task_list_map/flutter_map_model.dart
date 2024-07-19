import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rotation_app/core/mixin/permission.dart';

import 'package:rotation_app/features/task_list_map/flutter_map.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/icons.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/router/app_router.dart' as router;

abstract class FlutterMapModel extends ConsumerState<CustomFlutterMap> with PermissionMixin {
  final ValueNotifier<bool> isMapLoading = ValueNotifier(true);

  List<Marker> markers = [];

  List<Task>? tasks;
  LatLng currentLocation = const LatLng(0.0, 0.0);
  MapController mapController = MapController();

  ValueNotifier<bool> infoWindowVisible = ValueNotifier(false);
  Task? selectedTask;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      addCurrentLocation();
      setMarkers();
    });
    super.initState();
  }

  Future<void> addCurrentLocation() async {
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

  void setMarkers() async {
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
              mapController.move(LatLng(lat, lng), 3);
              selectedTask = task;
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

  void updateCameraPosition() {
    mapController.move(currentLocation, 3);
  }

  detailPressed() {
    context.router.push(router.TaskDetail(task: selectedTask!));
  }
}
