part of 'create_timer_bloc.dart';

/// [CreateTimerState] is the state of the create timer BLoC.
@immutable
abstract class CreateTimerState extends Equatable {
  /// [dropDownProjectValue] is the value of the project dropdown.
  final ProjectEntity? dropDownProjectValue;

  /// [dropDownTaskValue] is the value of the task dropdown.
  final TaskEntity? dropDownTaskValue;

  /// [textEditingValue] is the value of the text editing.
  final String textEditingValue;

  /// [isChecked] is the value of the checkbox.
  final bool isChecked;

  /// Projects list
  final List<ProjectEntity?> projects;

  /// Projects list
  final List<TaskEntity?> tasks;

  @override
  List<Object?> get props => [
        dropDownProjectValue,
        dropDownTaskValue,
        textEditingValue,
        isChecked,
        projects,
        tasks,
      ];

  /// [CreateTimerState] constructor.
  const CreateTimerState({
    this.dropDownProjectValue,
    this.dropDownTaskValue,
    this.textEditingValue = '',
    this.isChecked = false,
    this.projects = const [],
    this.tasks = const [],
  });
}

/// [CreateTimerInitial] is the initial state of the create timer BLoC.
class CreateTimerInitial extends CreateTimerState {}

/// [CreateTimerLoading] is the loading state of the create timer BLoC.
class CreateTimerLoading extends CreateTimerState {
  @override
  List<Object?> get props => [
        dropDownProjectValue,
        dropDownTaskValue,
        textEditingValue,
        isChecked,
        projects,
        tasks,
      ];

  /// [CreateTimerLoading] constructor.
  const CreateTimerLoading({
    super.dropDownProjectValue,
    super.dropDownTaskValue,
    super.textEditingValue,
    super.isChecked,
    super.projects,
    super.tasks,
  });
}

/// [CreateTimerSuccess] is the success state of the create timer BLoC.
class CreateTimerSuccess extends CreateTimerState {
  @override
  List<Object?> get props => [
        dropDownProjectValue,
        dropDownTaskValue,
        textEditingValue,
        isChecked,
        projects,
        tasks,
      ];

  /// [CreateTimerSuccess] constructor.
  const CreateTimerSuccess({
    super.dropDownProjectValue,
    super.dropDownTaskValue,
    super.textEditingValue,
    super.isChecked,
    super.projects,
    super.tasks,
  });
}

/// [CreateTimerFailure] is the failure state of the create timer BLoC.
class CreateTimerFailure extends CreateTimerState {
  /// [message] is the error message.
  final String message;

  @override
  List<Object> get props => [message];

  /// [CreateTimerFailure] constructor.
  const CreateTimerFailure(this.message);
}

/// [CreateTimerFormState] is the form state of the create timer BLoC.
class CreateTimerFormState extends CreateTimerState {
  @override
  List<Object?> get props => [
        dropDownProjectValue,
        dropDownTaskValue,
        textEditingValue,
        isChecked,
        projects,
        tasks,
      ];

  /// [CreateTimerFormState] constructor.
  const CreateTimerFormState({
    super.dropDownProjectValue,
    super.dropDownTaskValue,
    super.textEditingValue,
    super.isChecked,
    super.projects,
    super.tasks,
  });
}

/// [CreateTimerNavigate] is the navigate state of the create timer BLoC.
class CreateTimerNavigate extends CreateTimerState {}
