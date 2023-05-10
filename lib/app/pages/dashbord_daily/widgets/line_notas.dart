import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class LineNotas extends StatelessWidget {
  final String label;
  final String value;

  const LineNotas({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Text(
                label,
                style: TextStyles.instance.texLabelH4.copyWith(
                  color: ColorsApp.instance.cardwhite,
                  fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: value == '99'
                  ? Container(
                      decoration: BoxDecoration(
                        color: ColorsApp.instance.cardnoselected,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'N/A',
                        style: TextStyles.instance.texLabelH4.copyWith(
                          color: ColorsApp.instance.cardwhite,
                          fontWeight:
                              TextStyles.instance.textSemiBold.fontWeight,
                        ),
                      ))
                  : Text(
                      value,
                      style: TextStyles.instance.texLabelH4.copyWith(
                        color: ColorsApp.instance.cardwhite,
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
