// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$LocationModelFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      completeAt: json['completeAt'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      distance: json['distance'] as double?,
      startAt: json['startAt'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'city': instance.city,
      'isCompleted': instance.isCompleted,
      'completeAt': instance.completeAt,
      'title': instance.title,
      'description': instance.description,
      'distance': instance.distance,
      'startAt': instance.startAt,
    };
