import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import '../../../core/ui/styles/text_styles.dart';

class LineSemester extends StatelessWidget {
  final String nameDay;
  final bool? isNow;

  const LineSemester({
    super.key,
    required this.nameDay,
    this.isNow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          nameDay == 'Dom' || nameDay == 'Sab'
              ? ColorsApp.instance.cardnoselected
              : isNow!
                  ? ColorsApp.instance.cardwhite
                  : ColorsApp.instance.background,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: nameDay == 'Dom' || nameDay == 'Sab'
          ? null
          : () {
              print('Clicou no dia $nameDay');
            },
      child: SizedBox(
        height: context.percentHeight(.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              nameDay,
              style: TextStyles.instance.texLabelH4.copyWith(
                color: ColorsApp.instance.labelblack3,
                fontWeight: TextStyles.instance.textSemiBold.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
