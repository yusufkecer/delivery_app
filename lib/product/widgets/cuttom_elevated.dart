import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/util/constants/colors.dart';

class CustomElevated extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  const CustomElevated({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor = ColorData.eyeBlue,
    this.textColor = ColorData.white,
    this.iconColor = ColorData.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(130, 45),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      icon: icon != null
          ? Icon(
              icon,
              color: iconColor,
            )
          : null,
      label: Text(
        label,
        style: context.textTheme.titleSmall!.copyWith(color: textColor),
      ),
    );
  }
}
