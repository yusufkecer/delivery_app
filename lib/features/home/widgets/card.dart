import 'package:flutter/material.dart';

import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/constant_design/spacer/vertical_spacer.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/icons.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/widgets/cuttom_elevated.dart';
import 'package:rotation_app/product/widgets/info_icon.dart';
import 'package:rotation_app/product/widgets/text_rich.dart';

class CardTask extends StatelessWidget {
  final String? title;
  final String? description;
  final String distance;
  final String address;
  final TaskStatus taskStatus;

  const CardTask({
    super.key,
    this.title,
    this.description,
    required this.distance,
    required this.address,
    required this.taskStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: info(context),
            trailing: const Icon(IconsData.forward),
          ),
          const VerticalSpace.xxxSmall(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevated(
                label: StringData.navigation,
                icon: IconsData.navigation,
                backgroundColor: ColorData.ocean,
                onPressed: () {},
              ),
              CustomElevated(
                label: StringData.taskDetail,
                icon: IconsData.details,
                backgroundColor: ColorData.riverBlue,
                onPressed: () {},
              ),
            ],
          ),
          const VerticalSpace.xSmall(),
        ],
      ),
    );
  }

  Column info(BuildContext context) {
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
        const VerticalSpace.xxSmall(),
        situation(taskStatus),
      ],
    );
  }

  Container situation(TaskStatus isCompleted) {
    Color? color = ColorData.red;
    if (isCompleted == TaskStatus.inProgress) {
      color = ColorData.amber;
    } else if (isCompleted == TaskStatus.completed) {
      color = ColorData.green;
    }
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InfoRich(
        title: StringData.situation,
        text: isCompleted.value,
        color: ColorData.white,
      ),
    );
  }
}
