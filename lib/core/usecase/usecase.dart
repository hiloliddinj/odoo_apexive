import 'package:dartz/dartz.dart';

import '../error/failure.dart';

/// UseCase is an abstract class that will be implemented by all the use cases
abstract class UseCase<Type, Params> {
  /// Call method will be implemented by all the use cases
  Future<Either<Failure, Type>> call(Params params);
}

/// NoParams is a class that will be used when the use case doesn't need any
/// parameters. This is useful when the use case doesn't need any parameters
/// to execute. For example, getting a list of users from the database. This
/// use case doesn't need any parameters to execute. So, we can use NoParams
/// class as the parameter type.
class NoParams {}
