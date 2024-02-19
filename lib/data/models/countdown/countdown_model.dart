// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_magic_number
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/database/hive_type_id_consts.dart';
import '../../../domain/entities/countdown/countdown_entity.dart';

part 'countdown_model.g.dart';

/// CountdownModel class
@HiveType(typeId: HiveTypeIdConsts.countDownModel)
class CountdownModel {
  /// Id of the countdown
  @HiveField(0)
  final int? id;

  /// Seconds
  @HiveField(1)
  final int? seconds;

  /// Is the timer ticking
  @HiveField(2)
  final bool? isTicking;

  /// CountdownModel constructor
  CountdownModel({
    required this.seconds,
    required this.id,
    required this.isTicking,
  });

  /// fromEntity method
  factory CountdownModel.fromEntity(CountdownEntity? entity) {
    return CountdownModel(
      id: entity?.id,
      seconds: entity?.seconds,
      isTicking: entity?.isTicking,
    );
  }

  /// toEntity method
  CountdownEntity toEntity() {
    return CountdownEntity(
      id: id,
      seconds: seconds,
      isTicking: isTicking,
    );
  }

  CountdownModel copyWith({
    int? id,
    int? seconds,
    bool? isTicking,
  }) {
    return CountdownModel(
      id: id ?? this.id,
      seconds: seconds ?? this.seconds,
      isTicking: isTicking ?? this.isTicking,
    );
  }
}
