import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rotation_app/core/mixin/permission.dart';

import 'package:rotation_app/features/task_list_map/flutter_map.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/constants/icons_data.dart';
import 'package:rotation_app/product/util/custom_marker/custom_marker.dart';
import 'package:rotation_app/product/util/dialog/dialog_util.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/router/app_router.dart' as router;

abstract class FlutterMapModel extends ConsumerState<CustomFlutterMap>
    with DialogUtil, WidgetsBindingObserver, PermissionMixin, TickerProviderStateMixin {
  final ValueNotifier<bool> isMapLoading = ValueNotifier(true);

  List<AnimatedMarker> markers = [];

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
    isMapLoading.value = false;
    if (position != null) {
      currentLocation = LatLng(position.latitude, position.longitude);

      markers.add(
        CustomMarkers(
          mapPoint: LatLng(position.latitude, position.longitude),
          icon: IconsData.myLocation,
          color: ColorData.eyeBlue,
        ),
      );
    }
  }

  void _setMarkers() async {
    if (tasks == null) {
      return;
    }
    for (var task in tasks!) {
      final double lat = double.tryParse(task.lat.toString())!;
      final double lng = double.tryParse(task.lng.toString())!;
      markers.add(
        CustomMarkers(
          onTap: () {
            currentLocation = LatLng(lat, lng);
            updateCameraPosition();
            selectedTask.value = task;
            infoWindowVisible.value = true;
          },
          mapPoint: LatLng(lat, lng),
          icon: IconsData.markerIcon,
          color: ColorData.red,
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
