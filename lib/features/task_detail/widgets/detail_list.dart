import 'package:flutter/material.dart';

import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/product/product_constant/project_padding.dart';
import 'package:rotation_app/product/product_constant/spacer/vertical_space.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/info_rich.dart';

class DetailList extends StatelessWidget {
  final Task task;
  const DetailList({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const ProjectPadding.cardPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const ProjectPadding.allPaddingTen().copyWith(bottom: 0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  task.title ?? "",
                  style: context.textTheme.titleMedium,
                ),
              ),
            ),
            const VerticalSpace.xSmall(),
            InfoRich(
              title: StringData.taskDetail,
              text: task.description ?? "",
            ),
            const VerticalSpace.xSmall(),
            InfoRich(
              title: StringData.situation,
              text: task.taskStatus.value,
            ),
            const VerticalSpace.xSmall(),
            InfoRich(
              title: StringData.address,
              text: "${task.city ?? ""} - ${task.address ?? ""}",
            ),
            const VerticalSpace.xSmall(),
            InfoRich(
              title: StringData.distance,
              text: task.distance.toString().kmOrM,
            ),
            if (task.startAt!.isNotEmpty) InfoRich(title: StringData.startAt, text: task.startAt!),
          ],
        ),
      ),
    );
  }
}
