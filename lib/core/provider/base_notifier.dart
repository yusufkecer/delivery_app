import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';
import 'package:rotation_app/product/util/models/task_model/task_model.dart';

class BaseNotifier extends ImpNotifiers {
  BaseNotifier._();
  static final BaseNotifier instance = BaseNotifier._();
  factory BaseNotifier() => instance;

  @override
  final StateNotifierProvider<TaskNotifier, List<Task>> task =
      StateNotifierProvider<TaskNotifier, List<Task>>((ref) => TaskNotifier());
}

abstract class ImpNotifiers {
  StateNotifierProvider<TaskNotifier, List<Task>> get task;
}
