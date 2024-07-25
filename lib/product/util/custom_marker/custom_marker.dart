import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';

@immutable
final class CustomMarkers extends AnimatedMarker {
  final IconData icon;
  final Color color;
  final void Function()? onTap;
  final LatLng mapPoint;
  CustomMarkers(
      {required this.mapPoint, AnimatedWidgetBuilder? builder, required this.icon, required this.color, this.onTap})
      : super(
          width: 100,
          height: 100,
          point: mapPoint,
          builder: builder ?? (context, animation) => GestureDetector(onTap: onTap, child: Icon(icon, color: color)),
        );
}
