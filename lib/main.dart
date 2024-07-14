import 'package:flutter/material.dart';
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
      key: GlobalKeyManager.instance.navigatorKey,
      title: StringData.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
