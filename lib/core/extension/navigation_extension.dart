import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/global/routing_settings.dart';

extension NavigatorKeyExtension on RoutingSettings {
  BuildContext? get currentContext {
    return route.navigatorKey.currentContext;
  }
}
