import 'package:academico_mobile/app/models/daily_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseSemestre {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mydatabase.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
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

  Future<void> saveSemestre(SemestreModel semestre) async {
    Database db = await database;

    int semestreId = await db.insert('semestre', {'semestre': semestre.semestre});

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

  Future<List<SemestreModel>> getAllSemestres() async {
    Database db = await database;

    List<Map<String, dynamic>> semestreRows = await db.query('semestre');
    List<SemestreModel> semestres = [];

    for (Map<String, dynamic> semestreRow in semestreRows) {
      int semestreId = semestreRow['id'];
      String semestre = semestreRow['semestre'];

      List<Map<String, dynamic>> disciplinaRows = await db.query('disciplina', where: 'semestre_id = ?', whereArgs: [semestreId]);
      List<DisciplinaModel> disciplinas = [];

      for (Map<String, dynamic> disciplinaRow in disciplinaRows) {
        int disciplinaId = disciplinaRow['id'];
        String nome = disciplinaRow['nome'];
        String professor = disciplinaRow['professor'];

        List<Map<String, dynamic>> resumoRows = await db.query('resumo', where: 'disciplina_id = ?', whereArgs: [disciplinaId]);
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
