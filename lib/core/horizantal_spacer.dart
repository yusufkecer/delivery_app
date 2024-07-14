import 'package:flutter/material.dart';
import 'package:rotation_app/product/util/size/widget_size.dart';

/// Returns a [SizedBox] with the given [width].
final class HorizontalSpace extends SizedBox {
  /// Returns a [SizedBox] with the 2px width.
  const HorizontalSpace.xxxSmall({super.key}) : super(width: WidgetSizes.spacingXSSs);

  /// Returns a [SizedBox] with the 8px width.
  const HorizontalSpace.xxSmall({super.key}) : super(width: WidgetSizes.spacingXs);

  /// Returns a [SizedBox] with the 12px width.
  const HorizontalSpace.xSmall({super.key}) : super(width: WidgetSizes.spacingS);

  /// Returns a [SizedBox] with the 16px width.
  const HorizontalSpace.standard({super.key}) : super(width: WidgetSizes.spacingM);

  /// Returns a [SizedBox] with the 20px width.
  const HorizontalSpace.small({super.key}) : super(width: WidgetSizes.spacingL);

  /// Returns a [SizedBox] with the 40px width.
  const HorizontalSpace.medium({super.key}) : super(width: WidgetSizes.spacingXxl4);

  /// Returns a [SizedBox] with the 60px width.
  const HorizontalSpace.large({super.key}) : super(width: WidgetSizes.spacingXxl8);

  /// Returns a [SizedBox] with the 100px width.
  const HorizontalSpace.xLarge({super.key}) : super(width: WidgetSizes.spacingXxl12);
}
