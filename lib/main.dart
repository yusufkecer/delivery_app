import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/router/custom_route_observer.dart';
import 'package:rotation_app/product/util/global/auto_route.dart';
import 'package:rotation_app/product/router/app_router.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

//!FIXME: Tamamlanan sonraki görevler için startAt düzenle
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
      theme: ThemeData(
        cardTheme: const CardTheme(
          color: ColorData.white,
          elevation: 4,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorData.eyeBlue,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: context.iconTheme.copyWith(color: ColorData.white),
          centerTitle: true,
          backgroundColor: ColorData.eyeBlue,
          titleTextStyle: context.textTheme.headlineSmall?.copyWith(
            color: ColorData.white,
          ),
        ),
        useMaterial3: true,
      ),
    );
  }
}
