import 'package:flutter/material.dart';

class ZeroTextButton extends StatelessWidget {
  final void Function()? pressed;
  final String text;
  const ZeroTextButton({
    Key? key,
    this.pressed,
    required this.text,
  }) : super(key: key);

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
