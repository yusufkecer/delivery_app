import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/size/widget_size.dart';

/// Returns a [SizedBox] with the given [height].
final class VerticalSpace extends SizedBox {
  /// Returns a [SizedBox] with the 100px height.
  const VerticalSpace.xLarge({super.key}) : super(height: WidgetSizes.spacingXxl12);

  /// Returns a [SizedBox] with the 60px height.
  const VerticalSpace.large({super.key}) : super(height: WidgetSizes.spacingXxl8);

  /// Returns a [SizedBox] with the 40px height.
  const VerticalSpace.medium({super.key}) : super(height: WidgetSizes.spacingXxl4);

  /// Returns a [SizedBox] with the 20px height.
  const VerticalSpace.small({super.key}) : super(height: WidgetSizes.spacingL);

  /// Returns a [SizedBox] with the 16px height.
  const VerticalSpace.standard({super.key}) : super(height: WidgetSizes.spacingM);

  /// Returns a [SizedBox] with the 12px height.
  const VerticalSpace.xSmall({super.key}) : super(height: WidgetSizes.spacingS);
}
