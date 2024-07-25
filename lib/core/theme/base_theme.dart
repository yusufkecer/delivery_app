import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  static ThemeManager get instance => _instance;
  ThemeManager._internal();

  ThemeData get themeData {
    return ThemeData(
      cardTheme: const CardTheme(
        color: ColorData.white,
        elevation: 4,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorData.eyeBlue,
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: ColorData.white,
        ),
        centerTitle: true,
        backgroundColor: ColorData.eyeBlue,
        titleTextStyle: TextStyle(
          color: ColorData.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
