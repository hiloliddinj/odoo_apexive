import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entities/form/completed_records_entity.dart';
import '../../../domain/entities/timer/timer_entity.dart';
import '../../../domain/usecases/complete_record_usecase.dart';

part 'timer_detail_event.dart';
part 'timer_detail_state.dart';

/// TimerDetailBloc
class TimerDetailBloc extends Bloc<TimerDetailEvent, TimerDetailState> {
  /// TimerDetailBloc constructor
  TimerDetailBloc() : super(TimerDetailInitial()) {
    on<CompleteRecord>((event, emit) async {
      emit(TimerDetailLoading());

      final response = await GetIt.I<CompleteRecordUseCase>().call(
        event.timerEntity,
        completedRecordsEntity: event.completedRecordsEntity,
      );

      response.fold(
        (failure) => emit(
          TimerDetailError(message: failure.message.toString()),
        ),
        (timerEntity) => emit(TimerDetailCompleted()),
      );
    });
  }
}
