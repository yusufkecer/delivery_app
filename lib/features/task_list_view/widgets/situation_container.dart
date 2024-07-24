import 'package:flutter/material.dart';

import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/mixin/situation_mixin.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/widgets/info_rich.dart';

class SituationContainer extends StatelessWidget with SituationMixin {
  final TaskStatus taskStatus;
  const SituationContainer({
    Key? key,
    required this.taskStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = situation(taskStatus);
    Color color = data["color"];
    TaskStatus isCompleted = taskStatus;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: infoRich(isCompleted),
    );
  }

  InfoRich infoRich(TaskStatus isCompleted) {
    return InfoRich(
      title: StringData.situation,
      text: isCompleted.value,
      color: ColorData.white,
    );
  }
}
