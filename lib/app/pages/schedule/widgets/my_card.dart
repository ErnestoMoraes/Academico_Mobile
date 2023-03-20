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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15, top: 0),
      decoration: BoxDecoration(
        color: ColorsApp.instance.cardnoselected,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                horarioDetalhado.horario,
                style: TextStyles.instance.texLabelH4.copyWith(
                    color: ColorsApp.instance.cardwhite,
                    fontWeight: TextStyles.instance.textExtraBold.fontWeight),
              ),
              Text(
                horarioDetalhado.sala,
                style: TextStyles.instance.texLabelH4.copyWith(
                    color: ColorsApp.instance.cardwhite,
                    fontWeight: TextStyles.instance.textExtraBold.fontWeight),
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  horarioDetalhado.disciplina,
                  style: TextStyles.instance.texLabelH4.copyWith(
                      color: ColorsApp.instance.cardwhite,
                      fontWeight: TextStyles.instance.textSemiBold.fontWeight),
                ),
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  horarioDetalhado.professor,
                  style: TextStyles.instance.texLabelH5.copyWith(
                      color: ColorsApp.instance.cardwhite,
                      fontWeight: TextStyles.instance.textSemiBold.fontWeight),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
