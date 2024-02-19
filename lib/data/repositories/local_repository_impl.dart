import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../../domain/entities/form/completed_records_entity.dart';
import '../../domain/entities/form/form_entity.dart';
import '../../domain/entities/timer/timer_entity.dart';
import '../../domain/repositories/local_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/form/completed_records/completed_records_model.dart';
import '../models/timer/db/timer_db_model.dart';
import '../models/timer/timer_model.dart';

/// Local Repository Implementation.
class LocalRepositoryImpl extends LocalRepository {
  /// Local Datasource
  final LocalDatasource localDatasource;

  /// Constructor for LocalRepositoryImpl.
  LocalRepositoryImpl({
    required this.localDatasource,
  });

  @override
  Future<Either<Failure, FormEntity?>> getFormEntity() async {
    try {
      final response = await localDatasource.getFormModel();

      return Right(response?.toEntity());
    } catch (error) {
      return Left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, List<TimerEntity?>>> getTimers() async {
    try {
      final response = await localDatasource.getTimers();
      final mapped = response.map((e) => e?.toEntity()).toList();

      return Right(mapped);
    } catch (error) {
      return Left(Failure(error));
    }
  }

  @override
  Either<Failure, ValueListenable<Box<TimerDbModel?>>?> getTimersStream() {
    try {
      final response = localDatasource.getTimersStream();

      return Right(response);
    } catch (error) {
      return Left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, NoParams>> submitTimer({
    required TimerEntity? timerEntity,
  }) async {
    try {
      await localDatasource.submitTimer(
        timerModel: TimerModel.fromEntity(timerEntity),
      );

      return Right(NoParams());
    } catch (error) {
      return Left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, NoParams>> completeRecord({
    required TimerEntity? timerEntity,
    required CompletedRecordsEntity? completedRecordsEntity,
  }) async {
    try {
      await localDatasource.completeRecord(
        timerModel: TimerModel.fromEntity(timerEntity),
        completedRecordsModel: CompletedRecordsModel.fromEntity(
          completedRecordsEntity,
        ),
      );

      return Right(NoParams());
    } catch (error) {
      return Left(Failure(error));
    }
  }

  @override
  Either<Failure, NoParams> tick({required TimerEntity? timerEntity}) {
    try {
      localDatasource.tick(timerEntity);

      return Right(NoParams());
    } catch (error) {
      return Left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, NoParams>> setTick(TimerEntity? timerEntity) async {
    try {
      await localDatasource.setTick(timerEntity);

      return Right(NoParams());
    } catch (error) {
      return Left(Failure(error));
    }
  }
}
