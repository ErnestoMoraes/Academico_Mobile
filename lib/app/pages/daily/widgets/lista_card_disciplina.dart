// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:academico_mobile/app/pages/dashbord_daily/dashboard_page.dart';
import 'package:flutter/material.dart';

import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/models/daily_model.dart';

// ignore: must_be_immutable
class ListaCardDisciplina extends StatelessWidget {
  DisciplinaModel disciplina;

  ListaCardDisciplina({
    Key? key,
    required this.disciplina,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorsApp.instance.background,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DashboardPage(
            disciplina: disciplina,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 0),
        decoration: BoxDecoration(
          color: ColorsApp.instance.cardwhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        disciplina.id.toString(),
                        style: TextStyles.instance.texLabelH5.copyWith(
                          color: ColorsApp.instance.labelblack1,
                          fontSize: 14,
                          fontWeight:
                              TextStyles.instance.textExtraBold.fontWeight,
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.005),
                      Text(
                        disciplina.nome,
                         style: TextStyles.instance.texLabelH4.copyWith(
                            color: ColorsApp.instance.labelblack1,
                            fontSize: 17,
                            fontWeight:
                                TextStyles.instance.textSemiBold.fontWeight),
                      ),
                      SizedBox(height: context.screenHeight * 0.002),
                      Text(
                        disciplina.professor,
                        style: TextStyles.instance.texLabelH5.copyWith(
                            color: ColorsApp.instance.labelblack1,
                            fontWeight:
                                TextStyles.instance.textSemiBold.fontWeight),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ColorsApp.instance.labelblack1,
                  size: context.screenHeight * 0.04,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}