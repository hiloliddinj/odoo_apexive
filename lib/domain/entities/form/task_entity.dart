import 'package:intl/intl.dart';

/// TaskEntity class
class TaskEntity {
  /// Id of the project
  final int? id;

  /// Title of the task
  final String? title;

  /// Description of the task
  final String? description;

  /// Whether the task is completed
  final DateTime? time;

  /// Assigned to
  final String? assignedTo;

  /// TaskEntity constructor
  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.assignedTo,
  });

  @override
  String toString() {
    return title ?? '';
  }

  /// Get the month of the project
  String getDay() {
    return DateFormat('EEEE').format(time ?? DateTime.now());
  }

  /// Get date 12.12.2021
  String getDate() {
    return DateFormat('dd/MM/yyyy').format(time ?? DateTime.now());
  }

  /// Get time
  String getTime() {
    return 'Start Time ${DateFormat('HH:mm').format(time ?? DateTime.now())}';
  }
}
