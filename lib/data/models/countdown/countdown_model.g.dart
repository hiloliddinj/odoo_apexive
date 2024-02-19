// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countdown_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountdownModelAdapter extends TypeAdapter<CountdownModel> {
  @override
  final int typeId = 6;

  @override
  CountdownModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountdownModel(
      seconds: fields[1] as int?,
      id: fields[0] as int?,
      isTicking: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, CountdownModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.seconds)
      ..writeByte(2)
      ..write(obj.isTicking);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountdownModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
