// ignore_for_file: avoid_global_state
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odoo_apexive/data/models/timer/db/timer_db_model.dart';

import '../../data/models/form/form_model.dart';

/// Hive Boxes
class HiveBoxes {
  /// Form Model Box
  static Box<FormModel?>? formModelBox;

  /// Timer Model Box
  static Box<TimerDbModel?>? timerDbModelBox;
}
