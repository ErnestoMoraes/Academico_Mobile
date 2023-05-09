// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:academico_mobile/app/pages/dashbord_daily/dashboard_page.dart';
import 'package:flutter/material.dart';

import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/models/daily_model.dart';

class ListaCardDisciplina extends StatelessWidget {
  final DisciplinaModel disciplina;

  const ListaCardDisciplina({
    Key? key,
    required this.disciplina,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorsApp.instance.background,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DashboardPage(
              disciplina: disciplina,
            ),
          ),
        );
      },
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
                      Container(
                        padding: EdgeInsets.all(context.screenHeight * 0.005),
                        decoration: BoxDecoration(
                          color: ColorsApp.instance.cardblue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          disciplina.id.trim(),
                          style: TextStyles.instance.texLabelH4.copyWith(
                            color: ColorsApp.instance.cardwhite,
                            fontWeight: TextStyles.instance.textBold.fontWeight,
                            fontSize: context.screenHeight * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.007),
                      Text(
                        disciplina.nome.trim(),
                        style: TextStyles.instance.texLabelH4.copyWith(
                            color: ColorsApp.instance.labelblack1,
                            fontSize: 15,
                            fontWeight:
                                TextStyles.instance.textBold.fontWeight),
                      ),
                      SizedBox(height: context.screenHeight * 0.007),
                      Text(
                        disciplina.professor.trim(),
                        style: TextStyles.instance.texLabelH5.copyWith(
                          color: ColorsApp.instance.labelblack1,
                          fontWeight:
                              TextStyles.instance.textSemiBold.fontWeight,
                        ),
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
