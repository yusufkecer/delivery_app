import 'package:permission_handler/permission_handler.dart';

enum PermissionType {
  location,
  camera,
  storage,
}

extension PermissionTypeExtension on PermissionType {
  Permission get permission {
    switch (this) {
      case PermissionType.location:
        return Permission.location;
      case PermissionType.camera:
        return Permission.camera;
      case PermissionType.storage:
        return Permission.storage;
      default:
        return Permission.unknown;
    }
  }
}
