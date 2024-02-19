// ignore_for_file: no_magic_number
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odoo_apexive/data/models/timer/timer_model.dart';

import '../../../../../core/database/hive_type_id_consts.dart';

part 'timer_db_model.g.dart';

/// TimerModel class
@HiveType(typeId: HiveTypeIdConsts.timerDbModel)
class TimerDbModel {
  /// Name of the project
  @HiveField(0)
  final List<TimerModel?>? timers;

  /// TimerModel constructor
  TimerDbModel({required this.timers});
}
