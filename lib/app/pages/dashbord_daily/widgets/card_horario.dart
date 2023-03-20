import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CardHorario extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;

  const CardHorario({
    super.key,
    required this.label,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? ColorsApp.instance.cardblue,
      margin: EdgeInsets.only(bottom: context.screenHeight * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              label,
              style: TextStyles.instance.texLabelH3.copyWith(
                color: ColorsApp.instance.cardwhite,
                fontWeight: TextStyles.instance.textSemiBold.fontWeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              value,
              style: TextStyles.instance.texLabelH3.copyWith(
                color: ColorsApp.instance.cardwhite,
                fontWeight: TextStyles.instance.textSemiBold.fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
