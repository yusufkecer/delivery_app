import 'package:flutter/material.dart';

import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/util/constants/colors.dart';

class CustomElevated extends StatelessWidget {
  final Function()? onPressed;
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

class DynmicButtonSize extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const DynmicButtonSize({
    super.key,
    this.height,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double height = this.height ?? context.height * .07;
    double width = this.width ?? context.width * .4;
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
