import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/product_constant/project_padding.dart';
import 'package:rotation_app/product/product_constant/custom_radius.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';

class InfoCard extends StatelessWidget {
  final Widget child;

  const InfoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double height = context.height * 0.12;
    double width = context.width * 0.8;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const ProjectPadding.allPaddingTen().copyWith(bottom: 20.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: CustomRadius.ten(),
            color: ColorData.white,
          ),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
