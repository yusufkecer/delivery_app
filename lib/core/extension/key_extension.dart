import 'package:flutter/material.dart';
import 'package:rotation_app/core/global/auto_route.dart';

extension NavigatorKeyExtension on RoutingSettings {
  BuildContext? get currentContext {
    return route.navigatorKey.currentContext;
  }
}
