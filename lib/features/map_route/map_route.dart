import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/features/map_route/map_route_model.dart';
import 'package:rotation_app/features/task_list_map/widgets/task_info_window.dart';

import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/flutter_map/flutter_map_widget.dart';

@RoutePage()
class MapRoute extends ConsumerStatefulWidget {
  final Task task;

  const MapRoute({
    super.key,
    required this.task,
  });

  @override
  ConsumerState<MapRoute> createState() => _MapRouteState();
}

class _MapRouteState extends MapRouteModel {
  @override
  Widget build(BuildContext context) {
    return FlutterMapWidget(
        markers: markers,
        animatedMapController: animatedMapController,
        backBtn: true,
        currentLocation: location,
        cardLayer: TaskInfoWindow(
          task: widget.task,
          detailPressed: detailPressed,
        ));
  }
}
