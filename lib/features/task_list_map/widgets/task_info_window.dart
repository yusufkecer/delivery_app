import 'package:flutter/material.dart';

import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/product_constant/project_padding.dart';
import 'package:rotation_app/product/product_constant/spacer/vertical_space.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/info_card.dart';
import 'package:rotation_app/product/widgets/zero_text_button.dart';

class TaskInfoWindow extends StatelessWidget {
  final Task task;
  final void Function()? detailPressed;
  final void Function()? routePressed;
  const TaskInfoWindow({
    super.key,
    required this.task,
    this.detailPressed,
    this.routePressed,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalSpace.xxxSmall(),
          Text("${task.title}", style: context.textTheme.titleMedium),
          Padding(
            padding: const ProjectPadding.horizontalFour(),
            child: Text(
              "${task.description}",
              style: context.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const VerticalSpace.xxxSmall(),
          buttons(),
        ],
      ),
    );
  }

  Row buttons() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ZeroTextButton(pressed: detailPressed, text: StringData.complete),
    ]);
  }
}
