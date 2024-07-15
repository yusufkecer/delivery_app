import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/core/global/key.dart';
import 'package:rotation_app/product/util/constants/image_path.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      title: Lottie.asset(
        AssetPath.delivery.lottie,
      ),
    );
  }
}

extension ShowLoading on MyLoading {
  void show<T>() {
    BuildContext? context = GlobalKeyManager.instance.key.currentContext;
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
    BuildContext? context = GlobalKeyManager.instance.key.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    Navigator.of(context).pop<T>(null);
  }
}
