// ignore_for_file: cyclomatic_complexity, no_magic_number
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:odoo_apexive/domain/usecases/get_timers_usecase.dart';

import '../../../core/usecase/usecase.dart';
import '../../../domain/entities/form/project_entity.dart';
import '../../../domain/entities/form/task_entity.dart';
import '../../../domain/entities/timer/timer_entity.dart';
import '../../../domain/usecases/get_form_entities_usecase.dart';
import '../../../domain/usecases/submit_timer_usecase.dart';

part 'create_timer_event.dart';
part 'create_timer_state.dart';

/// [CreateTimerBloc] is the BLoC of the create timer screen.
class CreateTimerBloc extends Bloc<CreateTimerEvent, CreateTimerState> {
  /// [CreateTimerBloc] constructor.
  CreateTimerBloc() : super(CreateTimerInitial()) {
    on<DropdownProjectChanged>((event, emit) {
      emit(
        CreateTimerFormState(
          projects: state.projects,
          tasks: state.tasks,
          dropDownProjectValue: event.value,
          dropDownTaskValue: state.dropDownTaskValue,
          textEditingValue: state.textEditingValue,
          isChecked: state.isChecked,
        ),
      );
    });

    on<DropdownTaskChanged>((event, emit) {
      emit(
        CreateTimerFormState(
          dropDownTaskValue: event.value,
          projects: state.projects,
          tasks: state.tasks,
          dropDownProjectValue: state.dropDownProjectValue,
          textEditingValue: state.textEditingValue,
          isChecked: state.isChecked,
        ),
      );
    });

    on<TextFieldChanged>((event, emit) {
      emit(
        CreateTimerFormState(
          textEditingValue: event.value,
          projects: state.projects,
          tasks: state.tasks,
          dropDownProjectValue: state.dropDownProjectValue,
          dropDownTaskValue: state.dropDownTaskValue,
          isChecked: state.isChecked,
        ),
      );
    });

    on<CheckBoxChanged>((event, emit) {
      emit(
        CreateTimerFormState(
          textEditingValue: state.textEditingValue,
          projects: state.projects,
          tasks: state.tasks,
          dropDownProjectValue: state.dropDownProjectValue,
          dropDownTaskValue: state.dropDownTaskValue,
          isChecked: event.value,
        ),
      );
    });

    on<CreateTimerLoadEvent>((event, emit) async {
      emit(const CreateTimerLoading());
      final response = await GetIt.I<GetFormEntitiesUseCase>().call(NoParams());
      response.fold(
        (l) => emit(CreateTimerFailure(l.toString())),
        (r) {
          emit(
            CreateTimerSuccess(
              projects: r?.projects ?? [],
              tasks: r?.tasks ?? [],
            ),
          );
        },
      );
    });

    on<CreateTimerCreateEvent>((event, emit) async {
      int id = 0;
      final lengthResponse = await GetIt.I<GetTimersUseCase>().call(NoParams());

      if (lengthResponse.isLeft()) {
        final Random random = Random();
        id = random.nextInt(1000000);
      } else if (lengthResponse.isRight()) {
        final timers = lengthResponse.getOrElse(() => []);
        id = timers.length + 1;
      }

      final timerEntity = TimerEntity(
        id: id,
        projectEntity: state.dropDownProjectValue,
        taskEntity: state.dropDownTaskValue,
        description: state.textEditingValue,
        isFavorite: state.isChecked,
      );
      emit(const CreateTimerLoading());
      final response = await GetIt.I<SubmitTimerUseCase>().call(timerEntity);
      response.fold(
        (l) => emit(CreateTimerFailure(l.toString())),
        (r) => emit(CreateTimerNavigate()),
      );
    });
  }
}
