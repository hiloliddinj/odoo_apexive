// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_magic_number
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odoo_apexive/data/models/form/project/project_model.dart';
import 'package:odoo_apexive/data/models/form/task/task_model.dart';
import 'package:odoo_apexive/domain/entities/timer/timer_entity.dart';

import '../../../../core/database/hive_type_id_consts.dart';

part 'timer_model.g.dart';

/// TimerModel class
@HiveType(typeId: HiveTypeIdConsts.timerModel)
class TimerModel {
  /// Id of the project
  @HiveField(0)
  final int? id;

  /// Name of the project
  @HiveField(1)
  final ProjectModel? projectModel;

  /// Description of the project
  @HiveField(2)
  final TaskModel? taskModel;

  /// Description of the project
  @HiveField(3)
  final String? description;

  /// Flag to check if the project is favorite
  @HiveField(4)
  final bool? isFavorite;

  /// TimerModel constructor
  TimerModel({
    required this.id,
    required this.projectModel,
    required this.taskModel,
    required this.description,
    required this.isFavorite,
  });

  /// fromEntity method
  factory TimerModel.fromEntity(TimerEntity? entity) {
    return TimerModel(
      id: entity?.id,
      projectModel: ProjectModel.fromEntity(entity?.projectEntity),
      taskModel: TaskModel.fromEntity(entity?.taskEntity),
      description: entity?.description,
      isFavorite: entity?.isFavorite,
    );
  }

  /// FormEntity toEntity method
  TimerEntity toEntity() {
    return TimerEntity(
      id: id ?? 0,
      projectEntity: projectModel?.toEntity(),
      taskEntity: taskModel?.toEntity(),
      description: description,
      isFavorite: isFavorite,
    );
  }

  TimerModel copyWith({
    ProjectModel? projectModel,
    TaskModel? taskModel,
    String? description,
    bool? isFavorite,
  }) {
    return TimerModel(
      id: id,
      projectModel: projectModel ?? this.projectModel,
      taskModel: taskModel ?? this.taskModel,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
