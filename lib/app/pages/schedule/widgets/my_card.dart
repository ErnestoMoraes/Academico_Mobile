import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final HorarioDetalhado horarioDetalhado;

  const MyCard({
    super.key,
    required this.horarioDetalhado,
  });

  colorBody() {
    if (horarioDetalhado.horario == '18:30 | 19:19') {
      return ColorsApp.instance.tarde;
    } else {
      return ColorsApp.instance.cardnoselected;
    }
  }

  colorLabel() {
    if (horarioDetalhado.horario == '18:30 | 19:19') {
      return ColorsApp.instance.cardwhite;
    } else {
      return ColorsApp.instance.cardwhite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15, top: 0),
      decoration: BoxDecoration(
        color: colorBody(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(context.screenHeight * 0.005),
            decoration: BoxDecoration(
              color: ColorsApp.instance.cardred,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              horarioDetalhado.horario,
              style: TextStyles.instance.texLabelH4.copyWith(
                color: ColorsApp.instance.cardwhite,
                fontWeight: TextStyles.instance.textBold.fontWeight,
                fontSize: context.screenHeight * 0.017,
              ),
            ),
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  horarioDetalhado.disciplina,
                  style: TextStyles.instance.texLabelH4.copyWith(
                    color: colorLabel(),
                    fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Text(
            horarioDetalhado.sala,
            style: TextStyles.instance.texLabelH4.copyWith(
              color: colorLabel(),
              fontWeight: TextStyles.instance.texLabelH4.fontWeight,
            ),
          ),
          // SizedBox(height: context.screenHeight * 0.015),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       child: Text(
          //         'Nome do Professor',
          //         style: TextStyles.instance.texLabelH4.copyWith(
          //           color: colorLabel(),
          //           fontWeight: TextStyles.instance.texLabelH4.fontWeight,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
