import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/core/extension/navigation_extension.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/global/route_settings.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  static ThemeManager get instance => _instance;
  ThemeManager._internal();

  ThemeData get themeData {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    return ThemeData(
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
    );
  }
}
