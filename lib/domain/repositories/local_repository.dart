import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../../data/models/timer/db/timer_db_model.dart';
import '../entities/form/completed_records_entity.dart';
import '../entities/form/form_entity.dart';
import '../entities/timer/timer_entity.dart';

/// Local repository abstract class.
abstract class LocalRepository {
  /// Get Project Model.
  Future<Either<Failure, FormEntity?>> getFormEntity();

  /// Submit Timer
  Future<Either<Failure, NoParams>> submitTimer({
    required TimerEntity? timerEntity,
  });

  /// Get Timers
  Future<Either<Failure, List<TimerEntity?>>> getTimers();

  /// Get Timers Stream
  Either<Failure, ValueListenable<Box<TimerDbModel?>>?> getTimersStream();

  /// Complete a record
  Future<Either<Failure, NoParams>> completeRecord({
    required TimerEntity? timerEntity,
    required CompletedRecordsEntity? completedRecordsEntity,
  });

  /// Tick
  Either<Failure, NoParams> tick({required TimerEntity? timerEntity});

  /// Submit Timer
  Future<Either<Failure, NoParams>> setTick(TimerEntity? timerEntity);
}
