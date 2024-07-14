import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

mixin GeolotatorMixin<T extends StatefulWidget> on State<T> {
  Position? position;

  Future<void> getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
