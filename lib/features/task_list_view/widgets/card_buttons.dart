import 'package:flutter/material.dart';

import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/mixin/situation_mixin.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/constants/icons_data.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/widgets/cuttom_elevated.dart';

@immutable
final class CardButtons extends StatelessWidget with SituationMixin {
  final TaskStatus taskStatus;

  final void Function() navigationPressed;
  final void Function() detailPressed;
  const CardButtons({
    super.key,
    required this.taskStatus,
    required this.navigationPressed,
    required this.detailPressed,
  });

  @override
  Widget build(BuildContext context) {
    Map status = situation(taskStatus);
    final String text = status["bttnText"];
    final IconData icon = status["icon"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DynmicButtonSize(
          child: CustomElevated(
            label: text,
            icon: icon,
            backgroundColor: ColorData.ocean,
            onPressed: taskStatus == TaskStatus.completed ? null : navigationPressed,
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
