import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotation_app/core/mixin/permission.dart';
import 'package:rotation_app/features/task_list_map/flutter_map.dart';

abstract class FlutterMapModel extends ConsumerState<CustomFlutterMap> with PermissionMixin {}
