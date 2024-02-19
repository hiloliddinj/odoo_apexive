import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../entities/form/form_entity.dart';
import '../repositories/local_repository.dart';

/// Get form entities use case
class GetFormEntitiesUseCase implements UseCase<FormEntity?, NoParams> {
  /// local repository.
  final LocalRepository localRepository;

  /// Get form entities use case constructor.
  const GetFormEntitiesUseCase({required this.localRepository});

  @override
  Future<Either<Failure, FormEntity?>> call(NoParams? params) async {
    return localRepository.getFormEntity();
  }
}
