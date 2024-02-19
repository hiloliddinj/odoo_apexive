import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/timer/timer_entity.dart';
import '../repositories/local_repository.dart';

/// Use case
class TickUseCase implements UseCase<NoParams, TimerEntity?> {
  /// Local repository.
  final LocalRepository localRepository;

  /// Use case constructor.
  const TickUseCase({required this.localRepository});

  @override
  Future<Either<Failure, NoParams>> call(TimerEntity? timerEntity) async {
    return localRepository.tick(timerEntity: timerEntity);
  }
}
