import 'package:flutter/material.dart';

import 'package:rotation_app/core/extension/context_extension.dart';

@immutable
final class InfoRich extends StatelessWidget {
  final String title;
  final String text;
  final Color? color;
  const InfoRich({
    super.key,
    required this.title,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title: ",
            style: context.textTheme.titleMedium!.copyWith(color: color),
          ),
          TextSpan(
            text: text,
            style: context.textTheme.bodyMedium!.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
