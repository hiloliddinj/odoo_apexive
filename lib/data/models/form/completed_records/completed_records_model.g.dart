// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_records_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletedRecordsModelAdapter extends TypeAdapter<CompletedRecordsModel> {
  @override
  final int typeId = 1;

  @override
  CompletedRecordsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletedRecordsModel(
      time: fields[0] as DateTime?,
      timer: fields[1] as int?,
      description: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompletedRecordsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.timer)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedRecordsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
