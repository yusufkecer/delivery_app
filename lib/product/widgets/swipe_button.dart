import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';

@immutable
final class SwipeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Future<bool?> Function() action;
  const SwipeButton({
    super.key,
    required this.label,
    required this.icon,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SliderButton(
      alignLabel: Alignment.center,
      action: action,
      label: Text(label),
      icon: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      width: context.width * 0.9,
      radius: 10,
      buttonColor: ColorData.eyeBlue,
      backgroundColor: ColorData.ocean,
      baseColor: ColorData.deepPurple,
    );
  }
}
