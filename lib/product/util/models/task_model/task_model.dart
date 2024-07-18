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
  String? startAt;
  final bool? isCompleted;
  final String? completeAt;
  final String? title;
  final String? description;
  final double? distance;
  late TaskStatus taskStatus;

  Task({
    this.id,
    this.lat,
    this.lng,
    this.address,
    this.city,
    this.startAt,
    this.isCompleted,
    this.completeAt,
    this.title,
    this.description,
    this.distance,
    this.taskStatus = TaskStatus.notStarted,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
