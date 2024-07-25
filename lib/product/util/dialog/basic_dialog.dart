import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/product_constant/spacer/vertical_space.dart';
import 'package:rotation_app/product/widgets/cuttom_elevated.dart';

@immutable
final class BasicDialog extends StatelessWidget {
  final String asset;
  final String title;
  final String description;
  final String buttonText;
  final Function() onPressed;
  final bool dissmissable;
  final bool? isAnimated;
  const BasicDialog({
    super.key,
    required this.asset,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    this.dissmissable = true,
    this.isAnimated = false,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: dissmissable,
      child: AlertDialog(
        title: Column(
          children: [
            Text(title),
            const VerticalSpace.xSmall(),
            isAnimated == true
                ? Lottie.asset(asset, height: 150, width: 150, repeat: false)
                : Image.asset(
                    asset,
                    height: 150,
                    width: 150,
                  ),
          ],
        ),
        content: Text(
          description,
          style: context.textTheme.titleMedium,
        ),
        actions: [
          CustomElevated(
            onPressed: onPressed,
            label: buttonText,
          ),
        ],
      ),
    );
  }
}
