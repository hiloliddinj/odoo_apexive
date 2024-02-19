part of 'timer_detail_bloc.dart';

/// TimerDetailEvent
sealed class TimerDetailEvent extends Equatable {
  @override
  List<Object> get props => [];

  const TimerDetailEvent();
}

/// CompleteRecord event
class CompleteRecord extends TimerDetailEvent {
  /// TimerEntity
  final TimerEntity timerEntity;

  /// CompletedRecordsEntity
  final CompletedRecordsEntity completedRecordsEntity;

  @override
  List<Object> get props => [timerEntity, completedRecordsEntity];

  /// CompleteRecord constructor
  const CompleteRecord({
    required this.timerEntity,
    required this.completedRecordsEntity,
  });
}
