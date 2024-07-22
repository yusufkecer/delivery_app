import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rotation_app/core/enum/permission_type.dart';
import 'package:rotation_app/core/extension/logger_extension.dart';

mixin PermissionMixin<T extends StatefulWidget> on State<T> {
  PermissionStatus? permissionStatus;
  PermissionType permissionType = PermissionType.location;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getLocation();
    });
  }

  Future<Position?> getLocation() async {
    await checkPermission();
    if (permissionStatus == PermissionStatus.denied) {
      "permission denied".info;
      await requestPermission();
    } else if (permissionStatus == PermissionStatus.granted) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      "position: $position".info;
      return position;
    }
    return null;
  }

  Future<void> requestPermission() async {
    await checkPermission();
    if (permissionStatus != PermissionStatus.granted) {
      permissionStatus = await permissionType.permission.request();
    }
    if (permissionStatus == PermissionStatus.granted) {
      await getLocation();
    }
  }

  Future<void> checkPermission() async {
    permissionStatus = await permissionType.permission.status;
  }
}
