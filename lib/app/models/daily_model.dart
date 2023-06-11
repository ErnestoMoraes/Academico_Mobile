class SemestreModel {
  String semestre;
  List<DisciplinaModel> disciplinas;

  SemestreModel({required this.semestre, required this.disciplinas});

  factory SemestreModel.fromJson(Map<String, dynamic> json) {
    List<DisciplinaModel> disciplinas = List<DisciplinaModel>.from(
        json["disciplinas"].map((x) => DisciplinaModel.fromJson(x)));
    return SemestreModel(semestre: json["semestre"], disciplinas: disciplinas);
  }

  Map<String, dynamic> toJson() => {
        "semestre": semestre,
        "disciplinas": List<dynamic>.from(
          disciplinas.map((x) => x.toJson()),
        ),
      };
}

class DisciplinaModel {
  String id;
  String nome;
  String professor;
  
  Resumo resumo;
  List<String> avaliacoes;

  DisciplinaModel({
    required this.id,
    required this.nome,
    required this.professor,
    required this.resumo,
    required this.avaliacoes,
  });

  factory DisciplinaModel.fromJson(Map<String, dynamic> json) {
    List<String> avaliacoes =
        List<String>.from(json["avaliacoes"].map((x) => x.toString()));
    return DisciplinaModel(
        id: json["id"] ?? '0',
        nome: json["nome"] ?? '',
        professor: json["professor"],
        resumo: Resumo.fromJson(json["resumo"]),
        avaliacoes: avaliacoes);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "professor": professor,
        "resumo": resumo.toJson(),
        "avaliacoes": List<dynamic>.from(avaliacoes.map((x) => x)),
      };
}

class Resumo {
  String cargaHoraria;
  String faltas;
  String aulasFuturas;
  List<String> presencas;
  List<String> ausencias;
  List<String> pendentes;

  Resumo({
    required this.cargaHoraria,
    required this.faltas,
    required this.aulasFuturas,
    required this.presencas,
    required this.ausencias,
    required this.pendentes,
  });

  factory Resumo.fromJson(Map<String, dynamic> json) {
    List<String> presencas = List<String>.from(
      json["presencas"].map((x) => x.toString()),
    );
    List<String> ausencias = List<String>.from(
      json["ausencias"].map((x) => x.toString()),
    );
    List<String> pendentes = List<String>.from(
      json["pendentes"].map((x) => x.toString()),
    );
    return Resumo(
        cargaHoraria: json["carga_horaria"],
        faltas: json["faltas"],
        aulasFuturas: json["aulas_futuras"],
        presencas: presencas,
        ausencias: ausencias,
        pendentes: pendentes);
  }

  Map<String, dynamic> toJson() => {
        "carga_horaria": cargaHoraria,
        "faltas": faltas,
        "aulas_futuras": aulasFuturas,
        "presencas": List<dynamic>.from(presencas.map((x) => x)),
        "ausencias": List<dynamic>.from(ausencias.map((x) => x)),
        "pendentes": List<dynamic>.from(pendentes.map((x) => x)),
      };
}
