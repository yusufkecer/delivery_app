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
    this.taskStatus = TaskStatus.notStarted,
  });
  //copyWith method

  Task copyWith({
    String? id,
    String? lat,
    String? lng,
    String? address,
    String? city,
    String? startAt,
    bool? isCompleted,
    String? title,
    String? description,
    double? distance,
    TaskStatus? taskStatus,
  }) {
    return Task(
        id: id ?? this.id,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        address: address ?? this.address,
        city: city ?? this.city,
        startAt: startAt ?? this.startAt,
        isCompleted: isCompleted ?? this.isCompleted,
        title: title ?? this.title,
        description: description ?? this.description,
        distance: distance ?? this.distance,
        taskStatus: taskStatus ?? this.taskStatus);
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
