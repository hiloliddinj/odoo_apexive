/// TimerModel class
class CountdownEntity {
  /// Id of the countdown
  final int? id;

  /// Seconds
  final int? seconds;

  /// Is the timer ticking
  final bool? isTicking;

  /// CountdownEntity constructor
  CountdownEntity({
    required this.id,
    required this.seconds,
    required this.isTicking,
  });
}
