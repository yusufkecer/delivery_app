import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/global/auto_route.dart';

extension NavigatorKeyExtension on RoutingSettings {
  BuildContext? get currentContext {
    return route.navigatorKey.currentContext;
  }
}
