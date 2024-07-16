import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rotation_app/core/enum/permission_type.dart';

mixin PermissionMixin<T extends StatefulWidget> on State<T> {
  PermissionStatus? permissionStatus;
  PermissionType permissionType = PermissionType.location;
  Logger logger = Logger();
  Position? position;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getLocation();
    });
  }

  Future<void> checkPermission() async {
    permissionStatus = await permissionType.permission.status;
    logger.i(permissionStatus);
  }

  Future<Position?> getLocation() async {
    if (permissionStatus == PermissionStatus.denied) {
      await requestPermission();
    }

    if (permissionStatus == PermissionStatus.granted) {
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((val) {
        position = val;
        logger.f("value: $position");
      });
    }

    return position;
  }

  Future<void> requestPermission() async {
    await checkPermission();
    if (permissionStatus != PermissionStatus.granted) {
      permissionStatus = await permissionType.permission.request();
    }
    await getLocation();
  }
}
