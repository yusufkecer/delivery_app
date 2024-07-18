import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/core/provider/base_notifier.dart';
import 'package:rotation_app/features/task_list_map/flutter_map_model.dart';
import 'package:rotation_app/product/constant_design/padding.dart';
import 'package:rotation_app/product/constant_design/spacer/vertical_spacer.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/service/api/api_url.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/icons.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';

import 'package:rotation_app/product/util/loading/lottie_loading.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/info_window.dart';

// ignore: must_be_immutable
class CustomFlutterMap extends ConsumerStatefulWidget {
  const CustomFlutterMap({super.key});

  @override
  ConsumerState<CustomFlutterMap> createState() => _CustomFlutterMapState();
}

class _CustomFlutterMapState extends FlutterMapModel {
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

  @override
  Widget build(BuildContext context) {
    TaskNotifier? task = ref.watch(NotifierManager.instance.task.notifier);
    tasks = task?.taskList;

    return ValueListenableBuilder(
        valueListenable: isMapLoading,
        builder: (context, value, child) {
          return !value ? flutterMap(value) : const MyLoading();
        });
  }

  FlutterMap flutterMap(val) {
    logger.i(tasks?[0]);
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        onTap: (tapPosition, point) {
          infoWindowVisible.value = false;
        },
        initialZoom: 3,
        minZoom: 3,
        onMapReady: () {
          updateCameraPosition();
          logger.i('Map is ready');
        },
        initialCenter: currentLocation,
      ),
      children: [
        TileLayer(
          urlTemplate: ApiUrl.mapUrl,
          subdomains: ApiUrl.subdomains,
          tileProvider: CancellableNetworkTileProvider(),
        ),
        MarkerLayer(markers: markers),
        ValueListenableBuilder(
            valueListenable: infoWindowVisible,
            builder: (context, value, child) {
              return selectedTask != null && value ? taskDetail(selectedTask!) : const SizedBox.shrink();
            })
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
          child: GestureDetector(
            onTap: () {
              mapController.move(LatLng(task.lat!, task.lng!), 3);
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

  Widget taskDetail(Task task) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpace.xxxSmall(),
          Text("${task.title}", style: context.textTheme.titleMedium),
          Padding(
            padding: const ProjectPadding.horizontalFour(),
            child: Text(
              "${task.description}",
              style: context.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const VerticalSpace.xxxSmall(),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            child: const Text(StringData.taskDetail),
          ),
        ],
      ),
    );
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

  void updateCameraPosition() {
    mapController.move(currentLocation, 3);
  }
}
