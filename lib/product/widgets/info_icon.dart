import 'package:flutter/material.dart';
import 'package:rotation_app/product/app_constant/spacer/horizantal_spacer.dart';

class InfoIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const InfoIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const HorizontalSpace.xxSmall(),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
