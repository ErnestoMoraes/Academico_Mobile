// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:academico_mobile/app/models/my_schedule/schedule_model.dart';

class CardSchedule extends StatelessWidget {
  final ScheduleModel schedule;

  const CardSchedule({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15, top: 0),
      // decoration: BoxDecoration(
      //   color: isNow!
      //       ? ColorsApp.instance.cardwhite
      //       : ColorsApp.instance.cardnoselected,
      //   borderRadius: BorderRadius.circular(5),
      // ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                schedule.weekHours[0].dia,
                // style: TextStyles.instance.texLabelH4.copyWith(
                //     color: isNow!
                //         ? ColorsApp.instance.background
                //         : ColorsApp.instance.cardwhite,
                //     fontWeight: TextStyles.instance.textExtraBold.fontWeight),
              ),
              Text(
                schedule.weekHours[0].classHour.toString(),
                // style: TextStyles.instance.texLabelH4.copyWith(
                //     color: isNow!
                //         ? ColorsApp.instance.background
                //         : ColorsApp.instance.cardwhite,
                //     fontWeight: TextStyles.instance.textExtraBold.fontWeight),
              ),
            ],
          ),
          // SizedBox(height: context.screenHeight * 0.02),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       child: Text(
          //         disciplina,
          //         style: TextStyles.instance.texLabelH4.copyWith(
          //             color: isNow!
          //                 ? ColorsApp.instance.background
          //                 : ColorsApp.instance.cardwhite,
          //             fontWeight: TextStyles.instance.textSemiBold.fontWeight),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: context.screenHeight * 0.02),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       child: Text(
          //         professor,
          //         style: TextStyles.instance.texLabelH5.copyWith(
          //             color: isNow!
          //                 ? ColorsApp.instance.background
          //                 : ColorsApp.instance.cardwhite,
          //             fontWeight: TextStyles.instance.textSemiBold.fontWeight),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
