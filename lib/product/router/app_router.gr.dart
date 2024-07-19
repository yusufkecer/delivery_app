// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    TaskDetail.name: (routeData) {
      final args = routeData.argsAs<TaskDetailArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: task_detail.TaskDetail(
          key: args.key,
          task: args.task,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaskDetail]
class TaskDetail extends PageRouteInfo<TaskDetailArgs> {
  TaskDetail({
    Key? key,
    required Task task,
    List<PageRouteInfo>? children,
  }) : super(
          TaskDetail.name,
          args: TaskDetailArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskDetail';

  static const PageInfo<TaskDetailArgs> page = PageInfo<TaskDetailArgs>(name);
}

class TaskDetailArgs {
  const TaskDetailArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final Task task;

  @override
  String toString() {
    return 'TaskDetailArgs{key: $key, task: $task}';
  }
}
