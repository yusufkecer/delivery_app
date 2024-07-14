import 'package:permission_handler/permission_handler.dart';

enum PermissionType {
  location,
  camera,
  storage,
  microphone,
  contacts,
  phone,
  calendar,
  notification,
  sms,
  speech,
  photos,
  reminders,
  mediaLibrary,
  bluetooth,
  motion,
  activity,
  unknown,
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
      case PermissionType.microphone:
        return Permission.microphone;
      case PermissionType.contacts:
        return Permission.contacts;
      case PermissionType.phone:
        return Permission.phone;
      case PermissionType.notification:
        return Permission.notification;
      case PermissionType.sms:
        return Permission.sms;
      case PermissionType.speech:
        return Permission.speech;
      case PermissionType.photos:
        return Permission.photos;
      case PermissionType.reminders:
        return Permission.reminders;
      case PermissionType.mediaLibrary:
        return Permission.mediaLibrary;
      case PermissionType.bluetooth:
        return Permission.bluetooth;
      case PermissionType.motion:
      default:
        return Permission.unknown;
    }
  }
}
