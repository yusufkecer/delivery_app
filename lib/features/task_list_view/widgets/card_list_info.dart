import 'package:flutter/material.dart';

import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/product_constant/spacer/vertical_space.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/constants/icons_data.dart';
import 'package:rotation_app/product/widgets/info_icon.dart';

class CardListInfo extends StatelessWidget {
  final String? title;
  final String? description;
  final String address;
  final String distance;
  const CardListInfo({
    Key? key,
    this.title,
    this.description,
    required this.address,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium,
        ),
        const VerticalSpace.xxSmall(),
        InfoIcon(text: address, icon: IconsData.location, iconColor: ColorData.deepPurple),
        const VerticalSpace.xxSmall(),
        InfoIcon(text: description ?? "", icon: IconsData.description, iconColor: ColorData.eyeBlue),
        const VerticalSpace.xxSmall(),
        InfoIcon(text: distance, icon: IconsData.distance, iconColor: ColorData.ocean),
      ],
    );
  }
}
