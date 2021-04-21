// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_quran_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuranModelAdapter extends TypeAdapter<QuranModel> {
  @override
  final int typeId = 1;

  @override
  QuranModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuranModel(
      index: fields[0] as int,
      surahName: fields[1] as String,
      numOfSurah: fields[2] as int,
      numOfAyah: fields[3] as int,
      surahTextArab: fields[4] as String,
      totalAyah: fields[5] as int,
      hasRead: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, QuranModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.surahName)
      ..writeByte(2)
      ..write(obj.numOfSurah)
      ..writeByte(3)
      ..write(obj.numOfAyah)
      ..writeByte(4)
      ..write(obj.surahTextArab)
      ..writeByte(5)
      ..write(obj.totalAyah)
      ..writeByte(6)
      ..write(obj.hasRead);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuranModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
