import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/usecase/usecase.dart';
import '../../../data/models/timer/db/timer_db_model.dart';
import '../../../domain/entities/timer/timer_entity.dart';
import '../../../domain/usecases/get_timers_stream_usecase.dart';
import '../../../domain/usecases/set_tick_usecase.dart';
import '../../../domain/usecases/tick_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

/// [HomeBloc] is the business logic component of the home screen.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// [HomeBloc] constructor.
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadEvent>((event, emit) async {
      emit(HomeLoading());

      final response = await GetIt.I<GetTimersStreamUseCase>().call(NoParams());
      response.fold(
        (l) => emit(HomeFailure(l.toString())),
        (r) => emit(HomeLoaded(stream: r)),
      );
    });

    on<HomeSetTickEvent>((event, emit) async {
      final TimerEntity? timerEntity = event.timer;

      final response = await GetIt.I<SetTickUseCase>().call(timerEntity);
      response.fold((l) => null, (r) => null);
    });

    on<HomeTickEvent>((event, emit) async {
      final TimerEntity? timerEntity = event.timer;

      final response = await GetIt.I<TickUseCase>().call(timerEntity);
      response.fold((l) => null, (r) => null);
    });
  }
}
