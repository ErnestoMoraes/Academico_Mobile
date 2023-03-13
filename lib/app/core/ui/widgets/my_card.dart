import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final bool? isNow;
  final String horario;
  final String sala;
  final String disciplina;
  final String professor;

  const MyCard({
    super.key,
    required this.horario,
    required this.sala,
    required this.disciplina,
    required this.professor,
    this.isNow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15, top: 0),
      decoration: BoxDecoration(
        color: isNow!
            ? ColorsApp.instance.cardwhite
            : ColorsApp.instance.cardnoselected,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                horario,
                style: TextStyles.instance.texLabelH4.copyWith(
                    color: isNow!
                        ? ColorsApp.instance.background
                        : ColorsApp.instance.cardwhite,
                    fontWeight: TextStyles.instance.textExtraBold.fontWeight),
              ),
              Text(
                sala,
                style: TextStyles.instance.texLabelH4.copyWith(
                    color: isNow!
                        ? ColorsApp.instance.background
                        : ColorsApp.instance.cardwhite,
                    fontWeight: TextStyles.instance.textExtraBold.fontWeight),
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  disciplina,
                  style: TextStyles.instance.texLabelH4.copyWith(
                      color: isNow!
                          ? ColorsApp.instance.background
                          : ColorsApp.instance.cardwhite,
                      fontWeight: TextStyles.instance.textSemiBold.fontWeight),
                ),
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  professor,
                  style: TextStyles.instance.texLabelH5.copyWith(
                      color: isNow!
                          ? ColorsApp.instance.background
                          : ColorsApp.instance.cardwhite,
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
