

class Horario {
  final int id;
  final String dia;
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
}
