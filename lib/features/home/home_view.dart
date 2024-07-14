import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/provider/base_notifier.dart';
import 'package:rotation_app/product/notifier/task_notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    TaskNotifier taskNotifier = ref.watch(BaseNotifier.instance.task.notifier);
    return const Column(
      children: [
        Text('Home'),
      ],
    );
  }
}
