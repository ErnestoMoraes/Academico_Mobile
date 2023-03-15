// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:academico_mobile/app/models/my_schedule/weekhours_model.dart';

class ScheduleModel {
  final List<WeekHoursModel> weekHours;
  ScheduleModel({
    required this.weekHours,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weekHours': weekHours.map((x) => x.toMap()).toList(),
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      weekHours: List<WeekHoursModel>.from(
        map['weekHours'].map<WeekHoursModel>(
          (weekHoursModel) => WeekHoursModel.fromMap(
              weekHoursModel.toList() ?? <WeekHoursModel>[]),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) =>
      ScheduleModel.fromMap(json.decode(source));
}

// {
//         "id": 0,
//         "dia": "Mon",
//         "horarios": [
//             {
//                 "id": 0,
//                 "horario": "18:30 ~ 19:19",
//                 "disciplina": "TCC II",
//                 "professor": "José Ernesto dos Santos Moraes",
//                 "turma": "01",
//                 "sala": "A1"
//             },
//             {
//                 "id": 1,
//                 "horario": "19:20 ~ 20:10",
//                 "disciplina": "Lógica de Programação",
//                 "professor": "José Ernesto dos Santos Moraes",
//                 "turma": "01",
//                 "sala": "A2"
//             },
//             {
//                 "id": 2,
//                 "horario": "20:20 ~ 21:09",
//                 "disciplina": "Sistemas Operacionais",
//                 "professor": "José Ernesto dos Santos Moraes",
//                 "turma": "01",
//                 "sala": "A3"
//             },
//             {
//                 "id": 3,
//                 "horario": "21:10 ~ 22:00",
//                 "disciplina": "Banco de Dados",
//                 "professor": "José Ernesto dos Santos Moraes",
//                 "turma": "01",
//                 "sala": "A4"
//             }
//         ]
//     },