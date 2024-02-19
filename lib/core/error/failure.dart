import 'package:equatable/equatable.dart';

/// General failure.
class Failure extends Equatable {
  /// General failure message.
  final Object message;

  @override
  List<Object?> get props => [message];

  /// General failure message.
  const Failure(this.message);
}
