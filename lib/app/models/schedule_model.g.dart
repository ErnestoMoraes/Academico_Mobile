// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HorarioAdapter extends TypeAdapter<Horario> {
  @override
  final int typeId = 1;

  @override
  Horario read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Horario(
      id: fields[0] ?? 0,
      dia: fields[1] ?? '',
      horarios: (fields[2] as List).cast<HorarioDetalhado>(),
    );
  }

  @override
  void write(BinaryWriter writer, Horario obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dia)
      ..writeByte(2)
      ..write(obj.horarios);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HorarioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HorarioDetalhadoAdapter extends TypeAdapter<HorarioDetalhado> {
  @override
  final int typeId = 2;

  @override
  HorarioDetalhado read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HorarioDetalhado(
      id: fields[0] ?? 0,
      horario: fields[1] ?? '',
      disciplina: fields[2] ?? '',
      professor: fields[3] ?? '',
      turma: fields[4] ?? '',
      sala: fields[5] ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, HorarioDetalhado obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.horario)
      ..writeByte(2)
      ..write(obj.disciplina)
      ..writeByte(3)
      ..write(obj.professor)
      ..writeByte(4)
      ..write(obj.turma)
      ..writeByte(5)
      ..write(obj.sala);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HorarioDetalhadoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
