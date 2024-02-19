// ignore_for_file: lines_longer_than_80_chars

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../data/models/timer/db/timer_db_model.dart';
import '../repositories/local_repository.dart';

/// Use case
class GetTimersStreamUseCase
    implements UseCase<ValueListenable<Box<TimerDbModel?>>?, NoParams> {
  /// Local repository.
  final LocalRepository localRepository;

  /// Use case constructor.
  const GetTimersStreamUseCase({required this.localRepository});

  @override
  Future<Either<Failure, ValueListenable<Box<TimerDbModel?>>?>> call(
    NoParams noParams,
  ) async {
    return localRepository.getTimersStream();
  }
}
