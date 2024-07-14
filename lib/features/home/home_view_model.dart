import 'package:rotation_app/core/mixin/location_permission.dart';
import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/dialog/dialog.dart';
import 'home_view.dart';

abstract class HomeModel extends State<Home> with PermissionMixin, DialogUtil {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }
}
