import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rotation_app/core/enum/permission_type.dart';
import 'package:rotation_app/core/extension/logger_extension.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog_util.dart';

mixin PermissionMixin<T extends StatefulWidget> on State<T>, DialogUtil, WidgetsBindingObserver {
  PermissionStatus? permissionStatus;
  PermissionType permissionType = PermissionType.location;

  Future<Position?> getLocation() async {
    await _checkPermission();

    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      StringData.permissionPermanentlyDenied.info;
      showErrorDialog(StringData.locationError, onPressed: _openSettings, dissmissable: false);
    } else if (permissionStatus == PermissionStatus.denied) {
      StringData.permissionDenied.info;
      await _requestPermission();
    } else if (permissionStatus == PermissionStatus.granted) {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      "${StringData.location} $position".info;
      return position;
    }
    return null;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.router.maybePop();
      getLocation();
    }
  }

  Future<void> _openSettings() async {
    await openAppSettings();
  }

  Future<void> _requestPermission() async {
    permissionStatus = await permissionType.permission.request();
    await getLocation();
  }

  Future<void> _checkPermission() async {
    permissionStatus = await permissionType.permission.status;
  }
}
