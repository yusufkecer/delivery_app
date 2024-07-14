import 'package:flutter/material.dart';

class CustomElevated extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Icon icon;
  final Color backgroundColor;
  const CustomElevated({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
    );
  }
}
