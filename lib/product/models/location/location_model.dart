import 'package:json_annotation/json_annotation.dart';
import 'package:rotation_app/product/models/base_model.dart';
part 'location_model.g.dart';

@JsonSerializable()
final class TaskModel implements IdModel {
  @override
  final String? id;
  final double? lat;
  final double? lng;
  final String? address;
  final String? city;
  final String? createdAt;

  const TaskModel({
    this.id,
    this.lat,
    this.lng,
    this.address,
    this.city,
    this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
