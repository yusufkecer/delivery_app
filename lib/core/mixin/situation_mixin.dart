import 'package:flutter/material.dart';
import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/constants/icons_data.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/models/situation_model.dart';

mixin SituationMixin {
  SituationModel situation(TaskStatus isCompleted) {
    Color color = ColorData.red;
    String text = StringData.notStarted;
    String bttnText = StringData.startTask;
    IconData icon = IconsData.navigation;
    if (isCompleted == TaskStatus.inProgress) {
      color = ColorData.amber!;
      text = StringData.onProgress;
      bttnText = StringData.continueTask;
    } else if (isCompleted == TaskStatus.completed) {
      color = ColorData.green;
      text = StringData.completed;
      bttnText = StringData.completed;
      icon = IconsData.check;
    }
    return SituationModel(color: color, text: text, icon: icon, bttnText: bttnText);
  }
}
