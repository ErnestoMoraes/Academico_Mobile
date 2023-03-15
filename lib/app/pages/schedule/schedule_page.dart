import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/models/my_schedule/classhours_model.dart';
import 'package:academico_mobile/app/models/my_schedule/schedule_model.dart';
import 'package:academico_mobile/app/models/my_schedule/weekhours_model.dart';
import 'package:academico_mobile/app/pages/schedule/widgets/delivery_schedule.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cronograma de Aulas',
          style: TextStyles.instance.labelPage,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: DeliverySchedule(
              schedule: ScheduleModel(
                weekHours: [
                  WeekHoursModel(
                    id: 1,
                    dia: 'Sun',
                    classHour: [
                      ClassHoursModel(
                        id: 1,
                        horario: '18:30 - 19:19',
                        disciplina: 'TRABALHO DE CONCLUSÃO DE CURSO II',
                        professor: 'KILBERT AMORIM MACIEL',
                        turma: '13.500.39',
                        sala: 'R011_LINF3',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '19:20 - 20:10',
                        disciplina: 'TRABALHO DE CONCLUSÃO DE CURSO II',
                        professor: 'KILBERT AMORIM MACIEL',
                        turma: '13.500.39',
                        sala: 'R011_LINF3',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '20:20 - 21:09',
                        disciplina: 'TRABALHO DE CONCLUSÃO DE CURSO II',
                        professor: 'KILBERT AMORIM MACIEL',
                        turma: '13.500.39',
                        sala: 'R011_LINF3',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '21:10 - 22:00',
                        disciplina: 'TRABALHO DE CONCLUSÃO DE CURSO II',
                        professor: 'KILBERT AMORIM MACIEL',
                        turma: '13.500.39',
                        sala: 'R011_LINF3',
                      ),
                    ],
                  ),
                  WeekHoursModel(
                    id: 1,
                    dia: 'Mon',
                    classHour: [
                      ClassHoursModel(
                        id: 1,
                        horario: '18:30 - 19:19',
                        disciplina: 'TRABALHO DE CONCLUSÃO DE CURSO II',
                        professor: 'KILBERT AMORIM MACIEL',
                        turma: '13.500.39',
                        sala: 'R011_LINF3',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      )
                    ],
                  ),
                  WeekHoursModel(
                    id: 1,
                    dia: 'Tue',
                    classHour: [
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      )
                    ],
                  ),
                  WeekHoursModel(
                    id: 1,
                    dia: 'Wed',
                    classHour: [
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      )
                    ],
                  ),
                  WeekHoursModel(
                    id: 1,
                    dia: 'Thu',
                    classHour: [
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      )
                    ],
                  ),
                  WeekHoursModel(
                    id: 1,
                    dia: 'Fri',
                    classHour: [
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      )
                    ],
                  ),
                  WeekHoursModel(
                    id: 1,
                    dia: 'Sat',
                    classHour: [
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      ),
                      ClassHoursModel(
                        id: 1,
                        horario: '2020',
                        disciplina: 'Pnc',
                        professor: 'Eu',
                        turma: 'vsf',
                        sala: 'sqn',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     // bool isNow = true;
//     List<String> days = [
//       'Dom',
//       'Seg',
//       'Ter',
//       'Qua',
//       'Qui',
//       'Sex',
//       'Sab',
//     ];
//     List<Map<String, dynamic>> horarios = [
//       {
//         'isNow': false,
//         'horario': "18:30",
//         'sala': 'R011_LINF3',
//         'disciplina':
//             'TRABALHO DE CONCLUSÃO DE CURSO ANALISE DE DADOS BANCARIOS COM DISTRIBUIDOS',
//         'professor': 'KILBERT AMORIM MACIEL',
//       },
//       {
//         'isNow': false,
//         'horario': '19:19',
//         'sala': 'R011_LINF3',
//         'disciplina': 'TRABALHO DE CONCLUSÃO DE CURSO II',
//         'professor': 'KILBERT AMORIM MACIEL',
//       },
//       {
//         'isNow': false,
//         'horario': '22:00',
//         'sala': 'R011_LINF3',
//         'disciplina': 'TRABALHO DE CONCLUSÃO DE CURSO III',
//         'professor':
//             'JOSE ERNESTO DOS SANTOS MORAES DE OLIVEIRA AQUINO AMORIM MACIEL',
//       },
//       {
//         'isNow': false,
//         'horario': "18:30",
//         'sala': 'R011_LINF3',
//         'disciplina':
//             'TRABALHO DE CONCLUSÃO DE CURSO ANALISE DE DADOS BANCARIOS COM DISTRIBUIDOS',
//         'professor': 'KILBERT AMORIM MACIEL',
//       },
//       {
//         'isNow': false,
//         'horario': "18:30",
//         'sala': 'R011_LINF3',
//         'disciplina':
//             'TRABALHO DE CONCLUSÃO DE CURSO ANALISE DE DADOS BANCARIOS COM DISTRIBUIDOS',
//         'professor': 'KILBERT AMORIM MACIEL',
//       },
//       {
//         'isNow': false,
//         'horario': '19:19',
//         'sala': 'R011_LINF3',
//         'disciplina': 'TRABALHO DE CONCLUSÃO DE CURSO II',
//         'professor': 'KILBERT AMORIM MACIEL',
//       },
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Cronograma de Aulas',
//           style: TextStyles.instance.labelPage,
//         ),
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 Text('Semana', style: TextStyles.instance.labelPage),
//               ],
//             ),
//             SizedBox(height: context.percentWidth(0.05)),
//             SizedBox(
//               height: 80,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: days.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 10),
//                     child: LineDays(
//                       nameDay: days[index],
//                       numberDay: '0${index.toString()}',
//                       isNow: index == 2 ? true : false,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: context.percentWidth(0.05)),
//             Row(
//               children: [
//                 Text('Disciplinas', style: TextStyles.instance.labelPage),
//               ],
//             ),
//             SizedBox(height: context.percentWidth(0.05)),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: horarios.length,
//                 itemBuilder: (context, index) {
//                   return MyCard(
//                       isNow: horarios[index]['isNow'],
//                       horario: horarios[index]['horario'],
//                       sala: horarios[index]['sala'],
//                       disciplina: horarios[index]['disciplina'],
//                       professor: horarios[index]['professor']);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
