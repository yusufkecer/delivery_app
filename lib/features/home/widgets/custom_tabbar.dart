import 'package:flutter/material.dart';

import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';

@immutable
final class CustomTabbar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? tabController;
  final List<Widget> tabsList;

  const CustomTabbar({
    super.key,
    this.tabController,
    required this.tabsList,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: ColorData.white,
      labelStyle: context.textTheme.titleMedium?.copyWith(
        color: ColorData.white,
      ),
      tabs: tabsList,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
