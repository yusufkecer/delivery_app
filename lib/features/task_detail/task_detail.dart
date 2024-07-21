import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/features/task_detail/task_detail_model.dart';
import 'package:rotation_app/features/task_detail/widgets/detail_list.dart';
import 'package:rotation_app/product/product_constant/padding.dart';
import 'package:rotation_app/product/product_constant/spacer/vertical_spacer.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
import 'package:rotation_app/product/widgets/cuttom_elevated.dart';

@RoutePage()
class TaskDetail extends ConsumerStatefulWidget {
  final Task task;
  const TaskDetail({super.key, required this.task});

  @override
  ConsumerState<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends TaskDetailModel {
  @override
  Widget build(BuildContext context) {
    taskNotifier = ref.read(taskNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringData.taskDetailTitle),
      ),
      body: Padding(
        padding: const ProjectPadding.allPaddingTen(),
        child: Column(
          children: [
            Card(
              child: DetailList(task: widget.task),
            ),
            const VerticalSpace.xSmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DynmicButtonSize(
                  width: context.width * 0.9,
                  child: CustomElevated(
                    label: buttonText,
                    onPressed: fun!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
