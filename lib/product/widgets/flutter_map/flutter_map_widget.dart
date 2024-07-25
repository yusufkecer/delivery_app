import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

import 'package:rotation_app/core/extension/logger_extension.dart';
import 'package:rotation_app/product/service/api/api_url.dart';
import 'package:rotation_app/product/widgets/flutter_map/map_back_button.dart';

@immutable
final class FlutterMapWidget extends StatelessWidget {
  final AnimatedMapController? animatedMapController;
  final List<AnimatedMarker>? markers;
  final LatLng? currentLocation;
  final Widget? cardLayer;
  final bool? backBtn;
  final List<Polyline>? polylines;
  final double initialZoom;
  final void Function(TapPosition? tapPosition, LatLng? point)? onTap;

  const FlutterMapWidget({
    super.key,
    this.animatedMapController,
    this.markers,
    this.currentLocation = const LatLng(0.0, 0.0),
    this.cardLayer,
    this.backBtn,
    this.polylines,
    this.initialZoom = 10,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: animatedMapController?.mapController,
      options: MapOptions(
          onTap: onTap,
          initialZoom: initialZoom,
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
        if (backBtn ?? false) const MapBackButton(),
        polyLayer(),
      ],
    );
  }

  PolylineLayer<Object> polyLayer() {
    if (polylines == null) {
      return const PolylineLayer(polylines: []);
    }
    return PolylineLayer(polylines: polylines!);
  }

  Widget infoWindow() {
    return cardLayer ?? const SizedBox.shrink();
  }

  AnimatedMarkerLayer markerLayer() => AnimatedMarkerLayer(
        markers: markers ?? [],
      );

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
}
