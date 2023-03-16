import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import '../../../core/ui/styles/text_styles.dart';

class LineDays extends StatelessWidget {
  final String nameDay;
  final String? numberDay;
  final bool? isNow;

  const LineDays({
    super.key,
    required this.nameDay,
    this.numberDay,
    this.isNow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          nameDay == 'Sun' || nameDay == 'Sat'
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
      onPressed: nameDay == 'Sun' || nameDay == 'Sat'
          ? null
          : () {
            },
      child: SizedBox(
        height: context.percentHeight(.2),
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
            Text(
              numberDay?? '',
              style: TextStyles.instance.texLabelH4.copyWith(
                color: ColorsApp.instance.labelblack4,
                fontWeight: TextStyles.instance.textExtraBold.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
