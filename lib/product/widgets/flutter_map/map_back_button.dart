import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@immutable
final class MapBackButton extends StatelessWidget {
  const MapBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
      ),
    );
  }
}
