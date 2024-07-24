import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rotation_app/core/extension/navigation_extension.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/product/util/global/route_settings.dart';
import 'package:rotation_app/product/util/constants/asset_path.dart';

class LottieLoading extends StatelessWidget {
  const LottieLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        backgroundColor: Colors.transparent,
        title: Lottie.asset(
          AssetPath.delivery.lottie,
        ),
      ),
    );
  }
}

extension ShowLoading on LottieLoading {
  void show<T>() {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  void hide<T>() {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    Navigator.of(context).pop<T>(null);
  }
}
