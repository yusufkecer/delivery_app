import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:rotation_app/core/extension/key_extension.dart';

import 'package:rotation_app/core/extension/logger_extension.dart';
import 'package:rotation_app/product/service/api/api_url.dart';
import 'package:rotation_app/product/util/global/auto_route.dart';

class FlutterMapWidget extends StatelessWidget {
  final AnimatedMapController? animatedMapController;
  final List<Marker>? markers;
  final LatLng? currentLocation;
  final Widget? cardLayer;
  final bool? backBtn;
  final void Function(TapPosition? tapPosition, LatLng? point)? onTap;

  const FlutterMapWidget({
    super.key,
    this.animatedMapController,
    this.markers,
    this.currentLocation = const LatLng(0.0, 0.0),
    this.cardLayer,
    this.backBtn,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: animatedMapController?.mapController,
      options: MapOptions(
          onTap: onTap,
          initialZoom: 3,
          minZoom: 3,
          onMapReady: () {
            updateCameraPosition();
            'Map ready'.info;
          },
          initialCenter: currentLocation ?? const LatLng(0.0, 0.0)),
      children: [
        tileLayer(),
        markerLayer(),
        infoWindow(),
        backButton(),
      ],
    );
  }

  Widget infoWindow() {
    return cardLayer ?? const SizedBox.shrink();
  }

  MarkerLayer markerLayer() => MarkerLayer(markers: markers ?? []);

  TileLayer tileLayer() {
    return TileLayer(
      urlTemplate: ApiUrl.mapUrl,
      subdomains: ApiUrl.subdomains,
      tileProvider: CancellableNetworkTileProvider(),
    );
  }

  void updateCameraPosition() {
    animatedMapController?.animateTo(dest: currentLocation);
  }

  Widget backButton() {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (backBtn == true && context != null) {
      return Positioned(
        top: 10,
        left: 10,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.maybePop(),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
