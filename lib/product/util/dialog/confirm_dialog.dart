import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/widgets/cuttom_elevated.dart';

@immutable
final class ConfirmDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Function() onPressed;
  final String cancelText;
  final Function()? onCancel;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.cancelText,
    required this.onPressed,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Text(title),
        ],
      ),
      content: Text(
        description,
        style: context.textTheme.titleMedium,
      ),
      actions: [
        CustomElevated(
          onPressed: onCancel,
          label: cancelText,
        ),
        CustomElevated(
          onPressed: onPressed,
          label: buttonText,
        ),
      ],
    );
  }
}
