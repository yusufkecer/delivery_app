import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rotation_app/features/home/home_view.dart';
import 'package:rotation_app/features/task_detail/task_detail.dart' as task_detail;
import 'package:rotation_app/product/util/models/task_model/task_model.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(
          page: TaskDetail.page,
        ),
      ];
}
