import 'package:rotation_app/product/router/app_router.dart';

class RoutingSettings {
  AppRouter route = AppRouter();
  RoutingSettings._();
  static final RoutingSettings _instance = RoutingSettings._();
  static RoutingSettings get instance => _instance;
}
