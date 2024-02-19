part of 'home_bloc.dart';

/// [HomeEvent] is the event of the home screen.
sealed class HomeState extends Equatable {
  @override
  List<Object> get props => [];

  const HomeState();
}

/// [HomeInitial] is the initial state of the home screen.
final class HomeInitial extends HomeState {}

/// [HomeLoading] is the loading state of the home screen.
final class HomeLoading extends HomeState {}

/// [HomeLoaded] is the loaded state of the home screen.
final class HomeLoaded extends HomeState {
  /// [stream] is the list of timers.
  final ValueListenable<Box<TimerDbModel?>?>? stream;

  /// [HomeLoaded] constructor.
  const HomeLoaded({required this.stream});
}

/// [HomeFailure] is the error state of the home screen.
final class HomeFailure extends HomeState {
  /// [message] is the error message.
  final String message;

  @override
  List<Object> get props => [message];

  /// [HomeFailure] constructor.
  const HomeFailure(this.message);
}
