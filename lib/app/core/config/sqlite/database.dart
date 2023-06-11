import 'package:academico_mobile/app/models/daily_model.dart';
import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseGlobal {
  static Database? _database;
  static const String databaseName = 'mydatabase.db';

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE horario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        dia TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE horario_detalhado (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        horario_id INTEGER,
        horario TEXT,
        disciplina TEXT,
        professor TEXT,
        turma TEXT,
        sala TEXT,
        FOREIGN KEY (horario_id) REFERENCES horario (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE semestre (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        semestre TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE disciplina (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        semestre_id INTEGER,
        nome TEXT,
        professor TEXT,
        carga_horaria TEXT,
        faltas TEXT,
        aulas_futuras TEXT,
        FOREIGN KEY (semestre_id) REFERENCES semestre (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE resumo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        disciplina_id INTEGER,
        presenca TEXT,
        ausencia TEXT,
        pendente TEXT,
        FOREIGN KEY (disciplina_id) REFERENCES disciplina (id)
      )
    ''');
  }

  Future<void> saveHorario(CronogramaModel horario) async {
    Database db = await database;

    int horarioId = await db.insert('horario', {'dia': horario.dia});

    for (HorarioDetalhado horarioDetalhado in horario.horarios) {
      await db.insert('horario_detalhado', {
        'horario_id': horarioId,
        'horario': horarioDetalhado.horario,
        'disciplina': horarioDetalhado.disciplina,
        'professor': horarioDetalhado.professor,
        'turma': horarioDetalhado.turma,
        'sala': horarioDetalhado.sala,
      });
    }
  }

  Future<List<CronogramaModel>> getAllCronograma() async {
    Database db = await database;

    List<Map<String, dynamic>> horarioRows = await db.query('horario');
    List<CronogramaModel> horarios = [];

    for (Map<String, dynamic> horarioRow in horarioRows) {
      int horarioId = horarioRow['id'];
      String dia = horarioRow['dia'];

      List<Map<String, dynamic>> horarioDetalhadoRows = await db.query(
          'horario_detalhado',
          where: 'horario_id = ?',
          whereArgs: [horarioId]);
      List<HorarioDetalhado> horariosDetalhados = [];

      for (Map<String, dynamic> horarioDetalhadoRow in horarioDetalhadoRows) {
        horariosDetalhados.add(HorarioDetalhado(
          id: horarioDetalhadoRow['id'],
          horario: horarioDetalhadoRow['horario'],
          disciplina: horarioDetalhadoRow['disciplina'],
          professor: horarioDetalhadoRow['professor'],
          turma: horarioDetalhadoRow['turma'],
          sala: horarioDetalhadoRow['sala'],
        ));
      }

      horarios.add(CronogramaModel(
          id: horarioId, dia: dia, horarios: horariosDetalhados));
    }

    return horarios;
  }

  // Future<void> _createDatabase(Database db, int version) async {

  // }

  Future<void> saveSemestre(SemestreModel semestre) async {
    Database db = await database;

    int semestreId =
        await db.insert('semestre', {'semestre': semestre.semestre});

    for (DisciplinaModel disciplina in semestre.disciplinas) {
      int disciplinaId = await db.insert('disciplina', {
        'semestre_id': semestreId,
        'nome': disciplina.nome,
        'professor': disciplina.professor,
        'carga_horaria': disciplina.resumo.cargaHoraria,
        'faltas': disciplina.resumo.faltas,
        'aulas_futuras': disciplina.resumo.aulasFuturas,
      });

      for (String presenca in disciplina.resumo.presencas) {
        await db.insert('resumo', {
          'disciplina_id': disciplinaId,
          'presenca': presenca,
        });
      }

      for (String ausencia in disciplina.resumo.ausencias) {
        await db.insert('resumo', {
          'disciplina_id': disciplinaId,
          'ausencia': ausencia,
        });
      }

      for (String pendente in disciplina.resumo.pendentes) {
        await db.insert('resumo', {
          'disciplina_id': disciplinaId,
          'pendente': pendente,
        });
      }
    }
  }

  Future<void> deleteAllData() async {
    Database db = await database;
    await db.delete('semestre');
    await db.delete('disciplina');
    await db.delete('resumo');
    await db.delete('horario');
    await db.delete('horario_detalhado');
  }

  Future<List<SemestreModel>> getAllSemestres() async {
    Database db = await database;

    List<Map<String, dynamic>> semestreRows = await db.query('semestre');
    List<SemestreModel> semestres = [];

    for (Map<String, dynamic> semestreRow in semestreRows) {
      int semestreId = semestreRow['id'];
      String semestre = semestreRow['semestre'];

      List<Map<String, dynamic>> disciplinaRows = await db.query('disciplina',
          where: 'semestre_id = ?', whereArgs: [semestreId]);
      List<DisciplinaModel> disciplinas = [];

      for (Map<String, dynamic> disciplinaRow in disciplinaRows) {
        int disciplinaId = disciplinaRow['id'];
        String nome = disciplinaRow['nome'];
        String professor = disciplinaRow['professor'];

        List<Map<String, dynamic>> resumoRows = await db.query('resumo',
            where: 'disciplina_id = ?', whereArgs: [disciplinaId]);
        List<String> presencas = [];
        List<String> ausencias = [];
        List<String> pendentes = [];

        for (Map<String, dynamic> resumoRow in resumoRows) {
          if (resumoRow['presenca'] != null) {
            presencas.add(resumoRow['presenca']);
          }
          if (resumoRow['ausencia'] != null) {
            ausencias.add(resumoRow['ausencia']);
          }
          if (resumoRow['pendente'] != null) {
            pendentes.add(resumoRow['pendente']);
          }
        }

        DisciplinaModel disciplina = DisciplinaModel(
          id: disciplinaId.toString(),
          nome: nome,
          professor: professor,
          resumo: Resumo(
            cargaHoraria: disciplinaRow['carga_horaria'],
            faltas: disciplinaRow['faltas'],
            aulasFuturas: disciplinaRow['aulas_futuras'],
            presencas: presencas,
            ausencias: ausencias,
            pendentes: pendentes,
          ),
          avaliacoes: [],
        );

        disciplinas.add(disciplina);
      }

      SemestreModel semestreModel = SemestreModel(
        semestre: semestre,
        disciplinas: disciplinas,
      );

      semestres.add(semestreModel);
    }

    return semestres;
  }
}
