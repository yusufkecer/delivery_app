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
    MapRoutePage.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MapRoute(
          key: args.key,
          task: args.task,
        ),
      );
    },
    TaskDetailPage.name: (routeData) {
      final args = routeData.argsAs<TaskDetailArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskDetail(
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
/// [MapRoute]
class MapRoutePage extends PageRouteInfo<MapRouteArgs> {
  MapRoutePage({
    Key? key,
    required Task task,
    List<PageRouteInfo>? children,
  }) : super(
          MapRoutePage.name,
          args: MapRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<MapRouteArgs> page = PageInfo<MapRouteArgs>(name);
}

class MapRouteArgs {
  const MapRouteArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final Task task;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [TaskDetail]
class TaskDetailPage extends PageRouteInfo<TaskDetailArgs> {
  TaskDetailPage({
    Key? key,
    required Task task,
    List<PageRouteInfo>? children,
  }) : super(
          TaskDetailPage.name,
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
