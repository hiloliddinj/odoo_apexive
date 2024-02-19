import 'package:intl/intl.dart';

/// CompletedRecordsEntity class
class CompletedRecordsEntity {
  /// time of the project
  final DateTime? time;

  /// timer of the project
  final int? timer;

  /// Description of the project
  final String? description;

  /// CompletedRecordsEntity constructor
  CompletedRecordsEntity({
    required this.time,
    required this.timer,
    required this.description,
  });

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
