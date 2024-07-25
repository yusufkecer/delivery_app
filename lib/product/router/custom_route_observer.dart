import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/logger_extension.dart';

class CustomRouteObserver extends AutoRouteObserver {
  CustomRouteObserver._internal();
  static final CustomRouteObserver _instance = CustomRouteObserver._internal();
  static CustomRouteObserver get instance => _instance;

  String? previousRoute;

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    this.previousRoute = previousRoute?.settings.name;
    previousRoute.info;
  }
}
