import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/core/global/key.dart';
import 'package:rotation_app/features/home/home_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalKeyManager.instance.key,
      title: StringData.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorData.eyeBlue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorData.eyeBlue,
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
