class CronogramaModel {
  final int id;
  final String dia;
  final List<HorarioDetalhado> horarios;

  CronogramaModel({
    required this.id,
    required this.dia,
    required this.horarios,
  });

  factory CronogramaModel.fromJson(Map<String, dynamic> json) {
    final horariosList = json['horarios'] as List<dynamic>;
    final horarios = horariosList
        .map((horarioJson) => HorarioDetalhado.fromJson(horarioJson))
        .toList();

    return CronogramaModel(
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

class HorarioDetalhado {
  final int id;
  final String horario;
  final String disciplina;
  final String professor;
  final String turma;
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
