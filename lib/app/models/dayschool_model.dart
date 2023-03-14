// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:academico_mobile/app/models/disciplina_model.dart';

class DaySchoolModel {
  final int id;
  final String nameDay;
  final List<DisciplinaModel> disciplinas;

  DaySchoolModel({
    required this.id,
    required this.nameDay,
    required this.disciplinas,
  });
}
