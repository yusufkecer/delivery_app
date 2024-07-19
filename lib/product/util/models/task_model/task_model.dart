import 'package:json_annotation/json_annotation.dart';
import 'package:rotation_app/core/enum/task_status.dart';
import 'package:rotation_app/product/util/models/base_model.dart';
part 'task_model.g.dart';

@JsonSerializable()
class Task implements IdModel {
  @override
  final String? id;
  final String? lat;
  final String? lng;
  final String? address;
  final String? city;

  final bool? isCompleted;

  final String? title;
  final String? description;
  final double? distance;
  late TaskStatus taskStatus;
  String? startAt;
  Task({
    this.id,
    this.lat,
    this.lng,
    this.address,
    this.city,
    this.startAt,
    this.isCompleted,
    this.title,
    this.description,
    this.distance,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
