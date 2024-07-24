import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/features/map_route/map_route_model.dart';
import 'package:rotation_app/features/task_list_map/widgets/task_info_window.dart';
import 'package:rotation_app/product/util/loading/lottie_loading.dart';

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
    return ValueListenableBuilder(
      valueListenable: isLoading,
      builder: (context, value, child) => value == true ? const LottieLoading() : mapWidget(),
    );
  }

  SafeArea mapWidget() {
    return SafeArea(
      child: ValueListenableBuilder(
          valueListenable: polyLine,
          builder: (context, value, child) {
            return FlutterMapWidget(
              markers: markers,
              animatedMapController: animatedMapController,
              backBtn: true,
              currentLocation: location,
              polylines: polyLine.value,
              cardLayer: TaskInfoWindow(
                task: widget.task,
                detailPressed: detailPressed,
                routePressed: drawRoute,
              ),
            );
          }),
    );
  }
}
