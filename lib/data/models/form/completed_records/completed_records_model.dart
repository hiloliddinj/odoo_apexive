// ignore_for_file: no_magic_number
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/database/hive_type_id_consts.dart';
import '../../../../domain/entities/form/completed_records_entity.dart';

part 'completed_records_model.g.dart';

/// CompletedRecordsModel class
@HiveType(typeId: HiveTypeIdConsts.completedRecords)
class CompletedRecordsModel {
  /// time of the project
  @HiveField(0)
  final DateTime? time;

  /// timer of the project
  @HiveField(1)
  final int? timer;

  /// Description of the project
  @HiveField(2)
  final String? description;

  /// CompletedRecordsModel constructor
  CompletedRecordsModel({
    required this.time,
    required this.timer,
    required this.description,
  });

  /// fromEntity method
  factory CompletedRecordsModel.fromEntity(CompletedRecordsEntity? entity) {
    return CompletedRecordsModel(
      time: entity?.time,
      timer: entity?.timer,
      description: entity?.description,
    );
  }

  /// CompletedRecordsModel toEntity method
  CompletedRecordsEntity toEntity() {
    return CompletedRecordsEntity(
      time: time,
      timer: timer,
      description: description,
    );
  }
}
