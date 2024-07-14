// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$LocationModelFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      address: json['address'] as String?,
      city: json['city'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'city': instance.city,
      'createdAt': instance.createdAt,
    };
