import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/timer/timer_entity.dart';
import '../models/form/completed_records/completed_records_model.dart';
import '../models/form/form_model.dart';
import '../models/timer/db/timer_db_model.dart';
import '../models/timer/timer_model.dart';

/// Local Datasource is the abstract class that serves as the contract
/// for the Local Datasource Implementation.
abstract class LocalDatasource {
  /// Get Form Model
  Future<FormModel?> getFormModel();

  /// Save Project Model
  Future<void> saveFormModel({required FormModel? formModel});

  /// Submit Timer
  Future<void> submitTimer({required TimerModel? timerModel});

  /// Get Timers
  Future<List<TimerModel?>> getTimers();

  /// Get Timers
  ValueListenable<Box<TimerDbModel?>>? getTimersStream();

  /// Complete a record
  Future<void> completeRecord({
    required TimerModel? timerModel,
    required CompletedRecordsModel? completedRecordsModel,
  });

  /// Tick
  void tick(TimerEntity? timerEntity);

  /// Submit Timer
  Future<void> setTick(TimerEntity? timerEntity);
}
