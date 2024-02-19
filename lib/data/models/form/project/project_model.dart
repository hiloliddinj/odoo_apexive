// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_magic_number
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odoo_apexive/data/models/countdown/countdown_model.dart';
import 'package:odoo_apexive/data/models/form/completed_records/completed_records_model.dart';

import '../../../../core/database/hive_type_id_consts.dart';
import '../../../../domain/entities/form/project_entity.dart';

part 'project_model.g.dart';

/// ProjectModel class
@HiveType(typeId: HiveTypeIdConsts.projectModel)
class ProjectModel {
  /// Id of the project
  @HiveField(0)
  final int? id;

  /// Name of the project
  @HiveField(1)
  final String? name;

  /// Description of the project
  @HiveField(2)
  final String? description;

  /// time of the project
  @HiveField(3)
  final DateTime? time;

  /// Completed records of the project
  @HiveField(4)
  final List<CompletedRecordsModel?>? completedRecords;

  /// Countdown model
  @HiveField(5)
  final CountdownModel? countdownModel;

  /// ProjectModel constructor
  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.time,
    required this.completedRecords,
    required this.countdownModel,
  });

  /// fromEntity method
  factory ProjectModel.fromEntity(ProjectEntity? entity) {
    return ProjectModel(
      id: entity?.id,
      name: entity?.name,
      description: entity?.description,
      time: entity?.time,
      completedRecords: entity?.completedRecords?.map((e) {
        return CompletedRecordsModel.fromEntity(e);
      }).toList(),
      countdownModel: CountdownModel.fromEntity(entity?.countdownEntity),
    );
  }

  /// ProjectModel toEntity method
  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      name: name,
      description: description,
      time: time,
      completedRecords: completedRecords?.map((e) {
        return e?.toEntity();
      }).toList(),
      countdownEntity: countdownModel?.toEntity(),
    );
  }

  ProjectModel copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? time,
    List<CompletedRecordsModel?>? completedRecords,
    CountdownModel? countdownModel,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      time: time ?? this.time,
      completedRecords: completedRecords ?? this.completedRecords,
      countdownModel: countdownModel ?? this.countdownModel,
    );
  }
}
