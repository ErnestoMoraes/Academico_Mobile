import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_card.dart';
import 'package:academico_mobile/app/pages/schedule/widgets/line_days.dart';
import 'package:flutter/material.dart';

import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isNow = true;
    List<String> days = [
      'Dom',
      'Seg',
      'Ter',
      'Qua',
      'Qui',
      'Sex',
      'Sab',
    ];
    List<Map<String, dynamic>> horarios = [
      {
        'isNow': false,
        'horario': "18:30",
        'sala': 'R011_LINF3',
        'disciplina':
            'TRABALHO DE CONCLUSÃO DE CURSO ANALISE DE DADOS BANCARIOS COM DISTRIBUIDOS',
        'professor': 'KILBERT AMORIM MACIEL',
      },
      {
        'isNow': false,
        'horario': '19:19',
        'sala': 'R011_LINF3',
        'disciplina': 'TRABALHO DE CONCLUSÃO DE CURSO II',
        'professor': 'KILBERT AMORIM MACIEL',
      },
      {
        'isNow': false,
        'horario': '22:00',
        'sala': 'R011_LINF3',
        'disciplina': 'TRABALHO DE CONCLUSÃO DE CURSO III',
        'professor':
            'JOSE ERNESTO DOS SANTOS MORAES DE OLIVEIRA AQUINO AMORIM MACIEL',
      },
      {
        'isNow': false,
        'horario': "18:30",
        'sala': 'R011_LINF3',
        'disciplina':
            'TRABALHO DE CONCLUSÃO DE CURSO ANALISE DE DADOS BANCARIOS COM DISTRIBUIDOS',
        'professor': 'KILBERT AMORIM MACIEL',
      },
      {
        'isNow': false,
        'horario': "18:30",
        'sala': 'R011_LINF3',
        'disciplina':
            'TRABALHO DE CONCLUSÃO DE CURSO ANALISE DE DADOS BANCARIOS COM DISTRIBUIDOS',
        'professor': 'KILBERT AMORIM MACIEL',
      },
      {
        'isNow': false,
        'horario': '19:19',
        'sala': 'R011_LINF3',
        'disciplina': 'TRABALHO DE CONCLUSÃO DE CURSO II',
        'professor': 'KILBERT AMORIM MACIEL',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cronograma de Aulas',
          style: TextStyles.instance.labelPage,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Semana', style: TextStyles.instance.labelPage),
              ],
            ),
            SizedBox(height: context.percentWidth(0.05)),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: LineDays(
                      nameDay: days[index],
                      numberDay: '0${index.toString()}',
                      isNow: index == 2 ? true : false,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: context.percentWidth(0.05)),
            Row(
              children: [
                Text('Disciplinas', style: TextStyles.instance.labelPage),
              ],
            ),
            SizedBox(height: context.percentWidth(0.05)),
            Expanded(
              child: ListView.builder(
                itemCount: horarios.length,
                itemBuilder: (context, index) {
                  return MyCard(
                      isNow: horarios[index]['isNow'],
                      horario: horarios[index]['horario'],
                      sala: horarios[index]['sala'],
                      disciplina: horarios[index]['disciplina'],
                      professor: horarios[index]['professor']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
