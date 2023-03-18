import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MyAppbar extends AppBar {
  MyAppbar({
    super.key,
    double elevation = 0,
    required String title,
    String subtitle = '',
  }) : super(
          elevation: elevation,
          title: Text(title, style: TextStyles.instance.labelPage),
          centerTitle: true,
          backgroundColor: ColorsApp.instance.background,
          automaticallyImplyLeading: false,
        );
}
