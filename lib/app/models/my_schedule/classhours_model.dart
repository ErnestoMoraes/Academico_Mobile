import 'dart:convert';

class ClassHoursModel {
  final int id;
  final String horario;
  final String disciplina;
  final String professor;
  final String turma;
  final String sala;

  ClassHoursModel({
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

  factory ClassHoursModel.fromMap(Map<String, dynamic> map) {
    return ClassHoursModel(
      id: map['id']?.toInt() ?? 0,
      horario: map['horario'] ?? '',
      disciplina: map['disciplina'] ?? '',
      professor: map['professor'] ?? '',
      turma: map['turma'] ?? '',
      sala: map['sala'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassHoursModel.fromJson(String source) => ClassHoursModel.fromMap(json.decode(source));
}