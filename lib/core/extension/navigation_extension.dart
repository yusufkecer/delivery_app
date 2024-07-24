import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/global/route_settings.dart';

extension NavigatorKeyExtension on RoutingSettings {
  BuildContext? get currentContext {
    return route.navigatorKey.currentContext;
  }
}
