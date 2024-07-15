import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/constants/widget_size.dart';

final class VerticalSpace extends SizedBox {
  const VerticalSpace.xLarge({super.key}) : super(height: WidgetSizes.spacingXxl12);

  const VerticalSpace.large({super.key}) : super(height: WidgetSizes.spacingXxl8);

  const VerticalSpace.medium({super.key}) : super(height: WidgetSizes.spacingXxl4);

  const VerticalSpace.small({super.key}) : super(height: WidgetSizes.spacingL);

  const VerticalSpace.standard({super.key}) : super(height: WidgetSizes.spacingM);

  const VerticalSpace.xSmall({super.key}) : super(height: WidgetSizes.spacingS);

  const VerticalSpace.xxSmall({super.key}) : super(height: WidgetSizes.spacingXs);

  const VerticalSpace.xxxSmall({super.key}) : super(height: WidgetSizes.spacingXxs);
}
