import 'package:academico_mobile/app/core/ui/styles/app_styles.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBoder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: ColorsApp.instance.labelblack1),
  );

  static final _errorInputBoder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.red[400]!),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.instance.background,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.instance.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsApp.instance.cardwhite,
      ),
    ),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.background,
      primary: ColorsApp.instance.labelblack2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.buttonStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorsApp.instance.cardwhite,
      filled: true,
      isDense: true,
      hintStyle: TextStyles.instance.textButtonLabel,
      errorStyle: TextStyles.instance.textRegular.copyWith(
        color: Colors.redAccent,
      ),
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBoder,
      enabledBorder: _defaultInputBoder,
      focusedBorder: _defaultInputBoder,
      errorBorder: _errorInputBoder,
    ),
  );
}
