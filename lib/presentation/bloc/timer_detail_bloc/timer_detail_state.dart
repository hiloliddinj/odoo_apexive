part of 'timer_detail_bloc.dart';

/// TimerDetailState
sealed class TimerDetailState extends Equatable {
  @override
  List<Object> get props => [];

  const TimerDetailState();
}

/// TimerDetailInitial
final class TimerDetailInitial extends TimerDetailState {}

/// TimerDetailLoading
final class TimerDetailLoading extends TimerDetailState {}

/// TimerDetailCompleted
final class TimerDetailCompleted extends TimerDetailState {}

/// TimerDetailError
final class TimerDetailError extends TimerDetailState {
  /// Failure
  final String message;

  @override
  List<Object> get props => [message];

  /// TimerDetailError constructor
  const TimerDetailError({required this.message});
}
