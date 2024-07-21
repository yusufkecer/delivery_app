import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/product_constant/padding.dart';

import 'package:rotation_app/product/product_constant/spacer/vertical_spacer.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/info_window.dart';

class TaskInfoWindow extends StatelessWidget {
  final Task task;
  final void Function()? detailPressed;
  const TaskInfoWindow({
    super.key,
    required this.task,
    this.detailPressed,
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
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: detailPressed,
            child: const Text(StringData.taskDetail),
          ),
        ],
      ),
    );
  }
}
