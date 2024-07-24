import 'package:flutter/material.dart';
import 'package:rotation_app/product/router/app_router.dart';

@immutable
// ignore: must_be_immutable
final class RoutingSettings {
  AppRouter route = AppRouter();
  RoutingSettings._();
  static final RoutingSettings _instance = RoutingSettings._();
  static RoutingSettings get instance => _instance;
}
