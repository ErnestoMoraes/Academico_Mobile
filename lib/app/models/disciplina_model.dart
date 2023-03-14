// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DisciplinaModel {
  final int id;
  final String horario;
  final String disciplina;
  final String professor;
  final String turma;
  final String sala;

  DisciplinaModel({
    required this.id,
    required this.horario,
    required this.disciplina,
    required this.professor,
    required this.turma,
    required this.sala,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'horario': horario,
      'disciplina': disciplina,
      'professor': professor,
      'turma': turma,
      'sala': sala,
    };
  }

  factory DisciplinaModel.fromMap(Map<String, dynamic> map) {
    return DisciplinaModel(
      id: map['id']?.toInt() as int,
      horario: map['horario'] ?? '',
      disciplina: map['disciplina'] ?? '',
      professor: map['professor'] ?? '',
      turma: map['turma'] ?? '',
      sala: map['sala'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DisciplinaModel.fromJson(String source) =>
      DisciplinaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
