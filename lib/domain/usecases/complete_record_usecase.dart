import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/form/completed_records_entity.dart';
import '../entities/timer/timer_entity.dart';
import '../repositories/local_repository.dart';

/// Use case
class CompleteRecordUseCase implements UseCase<NoParams, TimerEntity?> {
  /// Local repository.
  final LocalRepository localRepository;

  /// Use case constructor.
  const CompleteRecordUseCase({required this.localRepository});

  @override
  Future<Either<Failure, NoParams>> call(
    TimerEntity? timerEntity, {
    CompletedRecordsEntity? completedRecordsEntity,
  }) async {
    return localRepository.completeRecord(
      timerEntity: timerEntity,
      completedRecordsEntity: completedRecordsEntity,
    );
  }
}
