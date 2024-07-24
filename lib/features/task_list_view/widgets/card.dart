import 'package:flutter/material.dart';

import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/mixin/situation_mixin.dart';
import 'package:rotation_app/features/task_list_view/widgets/card_buttons.dart';
import 'package:rotation_app/features/task_list_view/widgets/card_list_info.dart';
import 'package:rotation_app/features/task_list_view/widgets/situation_container.dart';
import 'package:rotation_app/product/product_constant/spacer/vertical_space.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/constants/icons_data.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/info_rich.dart';

@immutable
final class CardTask extends StatefulWidget {
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
  State<CardTask> createState() => _CardTaskState();
}

class _CardTaskState extends State<CardTask> with SituationMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          baseListTile(),
          const VerticalSpace.xxxSmall(),
          SituationContainer(taskStatus: widget.task.taskStatus),
          const VerticalSpace.xxSmall(),
          cardButton(),
          const VerticalSpace.xSmall(),
        ],
      ),
    );
  }

  CardButtons cardButton() {
    return CardButtons(
        detailPressed: widget.detailPressed,
        navigationPressed: widget.navigationPressed,
        taskStatus: widget.task.taskStatus);
  }

  ListTile baseListTile() {
    return ListTile(
      title: CardListInfo(
        title: widget.title,
        description: widget.description,
        address: widget.address,
        distance: widget.distance,
      ),
      trailing: const Icon(IconsData.forward),
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
