// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesModelsAdapter extends TypeAdapter<NotesModels> {
  @override
  final int typeId = 0;

  @override
  NotesModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesModels(
      heading: fields[0] as String,
      dscription: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotesModels obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.heading)
      ..writeByte(1)
      ..write(obj.dscription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
