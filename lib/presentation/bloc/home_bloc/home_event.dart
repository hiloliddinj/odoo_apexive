part of 'home_bloc.dart';

/// [HomeEvent] is the event of the home screen.
sealed class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const HomeEvent();
}

/// [HomeLoadEvent] is the load event of the home screen.
final class HomeLoadEvent extends HomeEvent {}

/// [HomeTickEvent] is the tick event of the home screen.
final class HomeTickEvent extends HomeEvent {
  /// [timer] is the timer entity.
  final TimerEntity? timer;

  @override
  List<Object?> get props => [timer];

  /// [HomeTickEvent] constructor.
  const HomeTickEvent(this.timer);
}

/// [HomeSetTickEvent] is the set tick event of the home screen.
final class HomeSetTickEvent extends HomeEvent {
  /// [timer] is the timer entity.
  final TimerEntity? timer;

  /// [value] is the value of the tick.
  final bool value;

  @override
  List<Object?> get props => [timer, value];

  /// [HomeSetTickEvent] constructor.
  const HomeSetTickEvent({
    required this.timer,
    required this.value,
  });
}
