import 'package:academico_mobile/app/models/week_model.dart';

class ScheduleModel {
  final String matricula;
  final String nome;
  final String semestreAtual;
  final WeekModel semana;

  ScheduleModel({
    required this.matricula,
    required this.nome,
    required this.semestreAtual,
    required this.semana,
  });

}

///matricula: 2020100000000
///nome de usuario: José Ernesto dos Santos Moraes
///semestre: 2022.2
///
///  var  semana = {
//   '5'  = {
//     {
//       horario: {
//         disciplina: {
//           nome: "Programação para Dispositivos Móveis";
//           professor:"José Ernesto dos Santos Moraes";
//           sala: "Sala 1";
//           semestre: 8;
//         }
//       }
//     }
//   }
// };
///
