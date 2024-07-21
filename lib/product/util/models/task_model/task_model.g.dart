// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      startAt: json['startAt'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      taskStatus:
          $enumDecodeNullable(_$TaskStatusEnumMap, json['taskStatus']) ??
              TaskStatus.notStarted,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'city': instance.city,
      'isCompleted': instance.isCompleted,
      'title': instance.title,
      'description': instance.description,
      'distance': instance.distance,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus]!,
      'startAt': instance.startAt,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.completed: 'completed',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.notStarted: 'notStarted',
};
