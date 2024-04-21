// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archived.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArchivedAdapter extends TypeAdapter<Archived> {
  @override
  final int typeId = 0;

  @override
  Archived read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Archived(
      (fields[0] as List).cast<Movie>(),
    );
  }

  @override
  void write(BinaryWriter writer, Archived obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.likeList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArchivedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
