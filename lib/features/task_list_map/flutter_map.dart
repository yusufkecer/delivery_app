import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/core/provider/base_notifier.dart';
import 'package:rotation_app/features/task_list_map/flutter_map_model.dart';
import 'package:rotation_app/product/app_constant/padding.dart';
import 'package:rotation_app/product/app_constant/spacer/vertical_spacer.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/service/api/api_url.dart';
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
      mapController: animatedMapController?.mapController,
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
            onPressed: detailPressed,
            child: const Text(StringData.taskDetail),
          ),
        ],
      ),
    );
  }
}
