import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rotation_app/core/mixin/permission.dart';

import 'package:rotation_app/features/map_route/map_route.dart';
import 'package:rotation_app/product/router/app_router.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog.dart';

abstract class MapRouteModel extends ConsumerState<MapRoute>
    with TickerProviderStateMixin, PermissionMixin, DialogUtil {
  List<Marker> markers = [];
  AnimatedMapController? animatedMapController;

  LatLng? location;
  @override
  void initState() {
    animatedMapController = AnimatedMapController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCurrentLocation();
    });
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    Position? position = await getLocation();
    if (position == null) {
      showErrorDialog(StringData.locationError);
      return;
    }
    location = LatLng(position.latitude, position.longitude);
  }

  void detailPressed() {
    context.router.push(TaskDetailPage(task: widget.task));
  }
}
