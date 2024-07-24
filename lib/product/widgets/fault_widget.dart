import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/product/util/constants/asset_path.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';

class FaultWidget extends StatelessWidget {
  const FaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Lottie.asset(
            AssetPath.errorDog.lottie,
            width: context.width * 0.6,
            height: context.height * 0.6,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.2,
          right: 0,
          left: 0,
          child: Center(
            child: Text(
              StringData.generalError,
              style: context.textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}
