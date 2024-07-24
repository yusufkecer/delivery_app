import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rotation_app/core/extension/logger_extension.dart';
import 'package:rotation_app/core/mixin/permission.dart';

import 'package:rotation_app/features/map_route/map_route.dart';
import 'package:rotation_app/product/router/app_router.dart';
import 'package:rotation_app/product/service/api/api_service.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/constants/icons_data.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog_util.dart';

abstract class MapRouteModel extends ConsumerState<MapRoute>
    with TickerProviderStateMixin, PermissionMixin, DialogUtil {
  List<AnimatedMarker> markers = [];
  AnimatedMapController? animatedMapController;
  double lat = 0.0;
  double lng = 0.0;
  LatLng? location;

  ValueNotifier<List<Polyline>> polyLine = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(true);
  @override
  void initState() {
    lat = double.tryParse(widget.task.lat.toString()) ?? 0.0;
    lng = double.tryParse(widget.task.lng.toString()) ?? 0.0;

    animatedMapController = AnimatedMapController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCurrentLocation();
      await drawRoute();
      isLoading.value = false;
    });
    super.initState();
  }

  void setMarkers() {
    markers = [
      AnimatedMarker(
        height: 100,
        width: 100,
        point: LatLng(lat, lng),
        builder: (context, animation) => const Icon(
          IconsData.markerIcon,
          color: ColorData.red,
        ),
        rotate: true,
      ),
      AnimatedMarker(
        height: 100,
        width: 100,
        point: location ?? const LatLng(0.0, 0.0),
        builder: (context, animation) => const Icon(
          IconsData.myLocation,
          color: ColorData.eyeBlue,
        ),
      ),
    ];
  }

  Future<void> drawRoute() async {
    ApiService apiService = ApiService();
    List? path = await apiService.getDirections("${location!.longitude},${location!.latitude}", "$lng,$lat");
    if (path == null || path.isEmpty) {
      showErrorDialog(StringData.routeError);
      return;
    }
    polyLine.value = [
      Polyline(
        points: path.map((e) => LatLng(e[1], e[0])).toList(),
        strokeWidth: 4.0,
        color: ColorData.eyeBlue,
      ),
    ];
  }

  Future<void> getCurrentLocation() async {
    Position? position = await getLocation();
    if (position == null) {
      showErrorDialog(StringData.locationError);
      return;
    }
    location = LatLng(position.latitude, position.longitude);
    "curretn location: $location".info;

    setMarkers();
  }

  void detailPressed() {
    context.router.push(TaskDetailPage(task: widget.task, isTaskComplete: true));
  }
}
