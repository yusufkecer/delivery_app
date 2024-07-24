import 'package:flutter/material.dart';

@immutable
final class ZeroTextButton extends StatelessWidget {
  final void Function()? pressed;
  final String text;
  const ZeroTextButton({
    super.key,
    this.pressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: pressed,
      child: Text(text),
    );
  }
}
