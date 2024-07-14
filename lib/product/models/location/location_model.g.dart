// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$LocationModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      address: json['address'] as String?,
      city: json['city'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'city': instance.city,
      'createdAt': instance.createdAt,
    };
