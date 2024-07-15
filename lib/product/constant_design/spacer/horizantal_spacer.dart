import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/constants/widget_size.dart';

final class HorizontalSpace extends SizedBox {
  const HorizontalSpace.xxxsSmall({super.key}) : super(width: WidgetSizes.spacingXSSs);

  const HorizontalSpace.xxSmall({super.key}) : super(width: WidgetSizes.spacingXs);

  const HorizontalSpace.xSmall({super.key}) : super(width: WidgetSizes.spacingS);

  const HorizontalSpace.standard({super.key}) : super(width: WidgetSizes.spacingM);

  const HorizontalSpace.small({super.key}) : super(width: WidgetSizes.spacingL);

  const HorizontalSpace.medium({super.key}) : super(width: WidgetSizes.spacingXxl4);

  const HorizontalSpace.large({super.key}) : super(width: WidgetSizes.spacingXxl8);

  const HorizontalSpace.xLarge({super.key}) : super(width: WidgetSizes.spacingXxl12);
}
