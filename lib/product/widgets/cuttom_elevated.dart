import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/constants/colors.dart';

class CustomElevated extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Icon? icon;
  final Color? backgroundColor;
  const CustomElevated({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor = ColorData.eyeBlue,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: const TextStyle(
          color: ColorData.white,
        ),
      ),
    );
  }
}
