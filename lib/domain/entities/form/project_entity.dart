import 'package:intl/intl.dart';

import '../countdown/countdown_entity.dart';
import 'completed_records_entity.dart';

/// ProjectEntity class
class ProjectEntity {
  /// Id of the project
  final int? id;

  /// Name of the project
  final String? name;

  /// Description of the project
  final String? description;

  /// time of the project
  final DateTime? time;

  /// Completed records of the project
  final List<CompletedRecordsEntity?>? completedRecords;

  /// Countdown entity
  final CountdownEntity? countdownEntity;

  /// ProjectEntity constructor
  ProjectEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.time,
    required this.completedRecords,
    required this.countdownEntity,
  });

  @override
  String toString() {
    return name ?? '';
  }

  /// Get the month of the project
  String getDay() {
    return DateFormat('EEEE').format(time ?? DateTime.now());
  }

  /// Get date 12.12.2021
  String getDate() {
    return DateFormat('dd.MM.yyyy').format(time ?? DateTime.now());
  }

  /// Get time
  String getTime() {
    return 'Start Time ${DateFormat('HH:mm').format(time ?? DateTime.now())}';
  }
}
