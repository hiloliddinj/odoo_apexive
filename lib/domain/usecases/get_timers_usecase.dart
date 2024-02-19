import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/timer/timer_entity.dart';
import '../repositories/local_repository.dart';

/// Use case
class GetTimersUseCase implements UseCase<List<TimerEntity?>, NoParams> {
  /// Local repository.
  final LocalRepository localRepository;

  /// Use case constructor.
  const GetTimersUseCase({required this.localRepository});

  @override
  Future<Either<Failure, List<TimerEntity?>>> call(NoParams noParams) async {
    return localRepository.getTimers();
  }
}
