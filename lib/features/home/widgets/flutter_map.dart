import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:logger/logger.dart';
import 'package:rotation_app/core/mixin/permission.dart';
import 'package:rotation_app/core/provider/base_notifier.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/service/api/api_url.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/icons.dart';

import 'package:rotation_app/product/util/loading/lottie_loading.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

// ignore: must_be_immutable
class CustomFlutterMap extends ConsumerStatefulWidget {
  const CustomFlutterMap({super.key});

  @override
  ConsumerState<CustomFlutterMap> createState() => _CustomFlutterMapState();
}

class _CustomFlutterMapState extends ConsumerState<CustomFlutterMap> with PermissionMixin {
  final ValueNotifier<bool> isMapLoading = ValueNotifier(true);

  List<Marker> markers = [];

  List<Task>? tasks;

  @override
  Widget build(BuildContext context) {
    TaskNotifier? task = ref.watch(NotifierManager.instance.task.notifier);
    tasks = task?.taskList;
    setMarkers();
    return ValueListenableBuilder(
        valueListenable: isMapLoading,
        builder: (context, value, child) {
          return checkLoading(value);
        });
  }

  Widget checkLoading(val) {
    return val ? flutterMap(val) : const MyLoading();
  }

  FlutterMap flutterMap(val) {
    Logger().i(tasks?[0]);
    return FlutterMap(
      options: MapOptions(
        initialZoom: 3,
        minZoom: 3,
        onMapReady: () {
          Logger().i('Map is ready');

          val = false;
        },
        initialCenter: LatLng(tasks![0].lat!, tasks![0].lng!),
      ),
      children: [
        TileLayer(
          urlTemplate: ApiUrl.mapUrl,
          subdomains: ApiUrl.subdomains,
          tileProvider: CancellableNetworkTileProvider(),
        ),
        MarkerLayer(markers: markers),
      ],
    );
  }

  void setMarkers() async {
    for (var task in tasks!) {
      markers.add(
        Marker(
          rotate: true,
          width: 80.0,
          height: 80.0,
          point: LatLng(task.lat!, task.lng!),
          child: const Icon(
            IconsData.markerIcon,
            color: ColorData.red,
            size: 40.0,
          ),
        ),
      );
    }
    await addCurrentLocation();
  }

//!FIXME: This method is not working properly
  Future<void> addCurrentLocation() async {
    Position? position = await getLocation();
    logger.e('position: $position');
    if (position != null) {
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
}
