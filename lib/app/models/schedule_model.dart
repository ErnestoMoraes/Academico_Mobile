
import 'package:hive/hive.dart';

part 'schedule_model.g.dart';

@HiveType(typeId: 1)
class Horario {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String dia;
  @HiveField(2)
  final List<HorarioDetalhado> horarios;

  Horario({
    required this.id,
    required this.dia,
    required this.horarios,
  });

  factory Horario.fromJson(Map<String, dynamic> json) {
    final horariosList = json['horarios'] as List<dynamic>;
    final horarios = horariosList
        .map((horarioJson) => HorarioDetalhado.fromJson(horarioJson))
        .toList();

    return Horario(
      id: json['id']?.toInt() ?? 0,
      dia: json['dia'] ?? '',
      horarios: horarios,
    );
  }

  Map<String, dynamic> toJson() {
    final horariosJson = horarios.map((horario) => horario).toList();

    return {
      'id': id,
      'dia': dia,
      'horarios': horariosJson,
    };
  }
}

@HiveType(typeId: 2)
class HorarioDetalhado {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String horario;
  @HiveField(2)
  late final String disciplina;
  @HiveField(3)
  final String professor;
  @HiveField(4)
  final String turma;
  @HiveField(5)
  final String sala;

  HorarioDetalhado({
    required this.id,
    required this.horario,
    required this.disciplina,
    required this.professor,
    required this.turma,
    required this.sala,
  });

  factory HorarioDetalhado.fromJson(Map<String, dynamic> json) {
    return HorarioDetalhado(
      id: json['id']?.toInt() ?? 0,
      horario: json['horario'] ?? '',
      disciplina: json['disciplina'] ?? '',
      professor: json['professor'] ?? '',
      turma: json['turma'] ?? '',
      sala: json['sala'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'horario': horario,
      'disciplina': disciplina,
      'professor': professor,
      'turma': turma,
      'sala': sala,
    };
  }
}
