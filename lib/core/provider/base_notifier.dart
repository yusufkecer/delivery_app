// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:rotation_app/product/notifier/task_notifier.dart';
// import 'package:rotation_app/product/util/models/task_model/task_model.dart';

// class NotifierManager extends BaseNotifiers {
//   NotifierManager._();
//   static final NotifierManager instance = NotifierManager._();
//   factory NotifierManager() => instance;

//   @override
//   final StateNotifierProvider<TaskNotifier, List<Task>> task =
//       StateNotifierProvider<TaskNotifier, List<Task>>((ref) => TaskNotifier());
// }

// abstract class BaseNotifiers {
//   StateNotifierProvider<TaskNotifier, List<Task>> get task;
// }
// // 