// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/pages/schedule/widgets/line_days.dart';
import 'package:flutter/material.dart';

import 'package:academico_mobile/app/models/my_schedule/schedule_model.dart';

class DeliverySchedule extends StatelessWidget {
  final List<Horario> schedule;

  const DeliverySchedule({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight(1),
      // color: Colors.amber,
      padding: EdgeInsets.symmetric(horizontal: context.percentWidth(0.02)),
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
              itemCount: schedule.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: LineDays(
                    nameDay: schedule[index].dia,
                    numberDay: '${DateTime.now().day}',
                    isNow: index == DateTime.now().weekday ? true : false,
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
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: schedule.weekHours[0].classHour.length,
          //     itemBuilder: (context, index) {
          //       return MyCard(
          //         isNow: false,
          //         horario: schedule.weekHours[0].classHour[index].horario,
          //         sala: schedule.weekHours[0].classHour[index].sala,
          //         disciplina: schedule.weekHours[0].classHour[index].disciplina,
          //         professor: schedule.weekHours[0].classHour[index].professor,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

        // Text(schedule.weekHours[0].id.toString(), style: TextStyles.instance.labelPage),
        // Text(schedule.weekHours[0].dia, style: TextStyles.instance.labelPage),
        // Text(schedule.weekHours[0].classHour[0].id.toString(), style: TextStyles.instance.labelPage),
        // Text(schedule.weekHours[0].classHour[0].disciplina, style: TextStyles.instance.labelPage),
        // Text(schedule.weekHours[0].classHour[0].sala, style: TextStyles.instance.labelPage),