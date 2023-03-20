import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class LineDashboard extends StatelessWidget {
  final String label;
  final String value;
  final String percent;

  const LineDashboard({
    super.key,
    required this.label,
    required this.value,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                label,
                style: TextStyles.instance.texLabelH4.copyWith(
                  color: ColorsApp.instance.labelblack4,
                  fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                value,
                style: TextStyles.instance.texLabelH4.copyWith(
                  color: ColorsApp.instance.labelblack4,
                  fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '$percent%',
                style: TextStyles.instance.texLabelH4.copyWith(
                  color: ColorsApp.instance.labelblack4,
                  fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: ColorsApp.instance.cardnoselected,
          thickness: 1,
        ),
      ],
    );
  }
}
