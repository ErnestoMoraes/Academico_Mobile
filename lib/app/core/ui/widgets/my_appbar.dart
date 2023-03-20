import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MyAppbar extends AppBar {
  MyAppbar({
    super.key,
    double elevation = 0,
    required String title,
    String subtitle = '',
    IconData icon = Icons.arrow_back_ios,
    required final VoidCallback onPressed,
  }) : super(
          elevation: elevation,
          title: Text(title, style: TextStyles.instance.labelPage),
          centerTitle: true,
          backgroundColor: ColorsApp.instance.background,
          leading: IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
          ),
        );
  MyAppbar.home({
    super.key,
    double elevation = 0,
    required String title,
    String subtitle = '',
    IconData icon = Icons.arrow_back_ios,
    required final bool isActivated,
  }) : super(
          elevation: elevation,
          title: Text(title, style: TextStyles.instance.labelPage),
          centerTitle: true,
          backgroundColor: ColorsApp.instance.background,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: isActivated
                    ? ColorsApp.instance.cardred
                    : ColorsApp.instance.cardgrey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "NO AR",
                style: TextStyles.instance.texLabelH3.copyWith(
                  color: isActivated
                      ? ColorsApp.instance.cardwhite
                      : ColorsApp.instance.cardwhite,
                  fontSize: 15,
                  fontWeight: TextStyles.instance.textButtonLabel.fontWeight,
                ),
              ),
            )
          ],
        );
}
