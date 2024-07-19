import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/product/constant_design/padding.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

@RoutePage()
class TaskDetail extends StatelessWidget {
  final Task task;
  const TaskDetail({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    String? startAt = task.startAt != null && task.startAt!.isNotEmpty ? task.startAt : "Başlanmadı";
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringData.taskDetailTitle),
      ),
      body: Padding(
        padding: const ProjectPadding.allPadding(),
        child: Column(
          children: [
            Card(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const ProjectPadding.allPadding().copyWith(bottom: 0),
                      child: Text(
                        task.title ?? "",
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    ListTile(
                      title: const Text(StringData.taskDetail),
                      subtitle: Text(task.description ?? ""),
                    ),
                    ListTile(
                      title: const Text(StringData.situation),
                      subtitle: Text(task.taskStatus.value),
                    ),
                    ListTile(
                      title: const Text(StringData.address),
                      subtitle: Text("${task.city ?? ""} - ${task.address ?? ""}"),
                    ),
                    ListTile(
                      title: const Text(StringData.startAt),
                      subtitle: Text(startAt ?? ""),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
