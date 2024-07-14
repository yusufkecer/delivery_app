import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rotation_app/core/enum/permission_type.dart';

mixin PermissionMixin<T extends StatefulWidget> on State<T> {
  PermissionStatus? permissionStatus;
  PermissionType permissionType = PermissionType.location;

  Future<void> checkPermission() async {
    permissionStatus = await permissionType.permission.status;
  }

  Future<void> requestPermission() async {
    await checkPermission();
    if (permissionStatus != PermissionStatus.granted) {
      permissionStatus = await permissionType.permission.request();
    } else {
      permissionStatus = PermissionStatus.granted;
    }
  }
}
