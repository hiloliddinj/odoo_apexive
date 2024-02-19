// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerDbModelAdapter extends TypeAdapter<TimerDbModel> {
  @override
  final int typeId = 5;

  @override
  TimerDbModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimerDbModel(
      timers: (fields[0] as List?)?.cast<TimerModel?>(),
    );
  }

  @override
  void write(BinaryWriter writer, TimerDbModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.timers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerDbModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
