import 'package:get_it/get_it.dart';

import '../../data/datasources/local_datasource.dart';
import '../../data/datasources/local_datasource_impl.dart';
import '../../data/repositories/local_repository_impl.dart';
import '../../domain/repositories/local_repository.dart';
import '../../domain/usecases/complete_record_usecase.dart';
import '../../domain/usecases/get_form_entities_usecase.dart';
import '../../domain/usecases/get_timers_stream_usecase.dart';
import '../../domain/usecases/get_timers_usecase.dart';
import '../../domain/usecases/set_tick_usecase.dart';
import '../../domain/usecases/submit_timer_usecase.dart';
import '../../domain/usecases/tick_usecase.dart';

/// initServiceLocator is a function that will be used to register all the
/// dependencies that will be used in the application. This function will be
/// called in the main.dart file.
Future<void> initServiceLocator() async {
  final GetIt locator = GetIt.instance;

  // DataSources
  locator.registerLazySingleton<LocalDatasource>(LocalDatasourceImpl.new);

  // Repositories
  locator.registerLazySingleton<LocalRepository>(
    () => LocalRepositoryImpl(
      localDatasource: locator<LocalDatasource>(),
    ),
  );

  // Use Cases
  locator.registerLazySingleton(
    () => GetFormEntitiesUseCase(localRepository: locator<LocalRepository>()),
  );
  locator.registerLazySingleton(
    () => SubmitTimerUseCase(localRepository: locator<LocalRepository>()),
  );
  locator.registerLazySingleton(
    () => GetTimersUseCase(localRepository: locator<LocalRepository>()),
  );
  locator.registerLazySingleton(
    () => GetTimersStreamUseCase(localRepository: locator<LocalRepository>()),
  );
  locator.registerLazySingleton(
    () => CompleteRecordUseCase(localRepository: locator<LocalRepository>()),
  );
  locator.registerLazySingleton(
    () => TickUseCase(localRepository: locator<LocalRepository>()),
  );
  locator.registerLazySingleton(
    () => SetTickUseCase(localRepository: locator<LocalRepository>()),
  );
}
