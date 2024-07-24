import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/product_constant/spacer/vertical_space.dart';
import 'package:rotation_app/product/widgets/cuttom_elevated.dart';

class BasicDialog extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String buttonText;
  final Function() onPressed;
  final bool dissmissable;

  const BasicDialog({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    this.dissmissable = true,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: dissmissable,
      child: AlertDialog(
        title: dialogTitle(),
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

  Column dialogTitle() {
    return Column(
      children: [
        Text(title),
        const VerticalSpace.xSmall(),
        Image.asset(
          image,
          height: 150,
          width: 150,
        ),
      ],
    );
  }
}
