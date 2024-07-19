import 'package:flutter/material.dart';

import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/app_constant/spacer/vertical_spacer.dart';
import 'package:rotation_app/product/util/constants/colors.dart';
import 'package:rotation_app/product/util/constants/icons.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/cuttom_elevated.dart';
import 'package:rotation_app/product/widgets/info_icon.dart';
import 'package:rotation_app/product/widgets/text_rich.dart';

class CardTask extends StatelessWidget {
  final String? title;
  final String? description;
  final String distance;
  final String address;
  final Task task;
  final void Function() navigationPressed;
  final void Function() detailPressed;

  const CardTask({
    super.key,
    this.title,
    this.description,
    required this.distance,
    required this.address,
    required this.task,
    required this.navigationPressed,
    required this.detailPressed,
  });

  @override
  Widget build(BuildContext context) {
    String navigationButtonName =
        task.taskStatus == TaskStatus.inProgress ? StringData.navigation : StringData.startTask;
    return Card(
      child: Column(
        children: [
          baseListTile(context),
          const VerticalSpace.xxxSmall(),
          situation(task.taskStatus),
          const VerticalSpace.xxSmall(),
          buttons(navigationButtonName),
          const VerticalSpace.xSmall(),
        ],
      ),
    );
  }

  ListTile baseListTile(BuildContext context) {
    return ListTile(
      title: info(context),
      trailing: const Icon(IconsData.forward),
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
      child: text(isCompleted),
    );
  }

  InfoRich text(TaskStatus isCompleted) {
    return InfoRich(
      title: StringData.situation,
      text: isCompleted.value,
      color: ColorData.white,
    );
  }

  Row buttons(String navigationButtonName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DynmicButtonSize(
          child: CustomElevated(
            label: navigationButtonName,
            icon: IconsData.navigation,
            backgroundColor: ColorData.ocean,
            onPressed: navigationPressed,
          ),
        ),
        DynmicButtonSize(
          child: CustomElevated(
            label: StringData.taskDetail,
            icon: IconsData.details,
            backgroundColor: ColorData.riverBlue,
            onPressed: detailPressed,
          ),
        ),
      ],
    );
  }
}
