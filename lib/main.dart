import 'package:flutter/material.dart';
import 'package:rotation_app/core/theme/base_theme.dart';
import 'package:rotation_app/product/router/custom_route_observer.dart';
import 'package:rotation_app/product/util/global/routing_settings.dart';
import 'package:rotation_app/product/router/app_router.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter router = RoutingSettings.instance.route;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(
        navigatorObservers: () => [CustomRouteObserver.instance],
      ),
      title: StringData.appTitle,
      theme: ThemeManager.instance.themeData,
    );
  }
}
