// ignore_for_file: no_magic_number
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odoo_apexive/domain/entities/form/task_entity.dart';

import '../../../../core/database/hive_type_id_consts.dart';

part 'task_model.g.dart';

/// TaskModel class
@HiveType(typeId: HiveTypeIdConsts.taskModel)
class TaskModel {
  /// Id of the project
  @HiveField(0)
  final int? id;

  /// Title of the task
  @HiveField(1)
  final String? title;

  /// Description of the task
  @HiveField(2)
  final String? description;

  /// Whether the task is completed
  @HiveField(3)
  final DateTime? time;

  /// Assigned to
  @HiveField(4)
  final String? assignedTo;

  /// TaskModel constructor
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.assignedTo,
  });

  /// fromEntity method
  factory TaskModel.fromEntity(TaskEntity? entity) {
    return TaskModel(
      id: entity?.id,
      title: entity?.title,
      description: entity?.description,
      time: entity?.time,
      assignedTo: entity?.assignedTo,
    );
  }

  /// TaskModel toEntity method
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      time: time,
      assignedTo: assignedTo,
    );
  }
}
