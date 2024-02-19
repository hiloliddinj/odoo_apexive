part of 'create_timer_bloc.dart';

/// [CreateTimerEvent] is the event of the create timer BLoC.
@immutable
abstract class CreateTimerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// [CreateTimerLoadEvent] is the started event of the create timer BLoC.
class CreateTimerLoadEvent extends CreateTimerEvent {}

/// This creates event of the create timer BLoC.
class CreateTimerCreateEvent extends CreateTimerEvent {}

/// This is called when the DropdownProjectChanged value is changed.
class DropdownProjectChanged extends CreateTimerEvent {
  /// [value] is the value of the DropdownProjectChanged.
  final ProjectEntity? value;

  /// [DropdownProjectChanged] constructor.
  DropdownProjectChanged(this.value);
}

/// This is called when the DropdownTaskChanged value is changed.
class DropdownTaskChanged extends CreateTimerEvent {
  /// [value] is the value of the DropdownTaskChanged.
  final TaskEntity? value;

  /// [DropdownTaskChanged] constructor.
  DropdownTaskChanged(this.value);
}

/// This is called when the TextFieldChanged value is changed.
class TextFieldChanged extends CreateTimerEvent {
  /// [value] is the value of the TextFieldChanged.
  final String value;

  /// [TextFieldChanged] constructor.
  TextFieldChanged(this.value);
}

/// This is called when the CheckBoxChanged value is changed.
class CheckBoxChanged extends CreateTimerEvent {
  /// [value] is the value of the CheckBoxChanged.
  final bool value;

  /// [CheckBoxChanged] constructor.
  CheckBoxChanged({this.value = false});
}
