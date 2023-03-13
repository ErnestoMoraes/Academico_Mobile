import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get background => const Color(0xFF1E1E1E);
  Color get cardnoselected => const Color(0xFF312F2F);
  Color get cardwhite => const Color(0xFFFFFFFF);

  Color get cardblue => const Color(0xFF0080FF);
  Color get cardred => const Color(0xFFF56D61);
  Color get cardgrey => const Color(0xFFA39C9B);

  Color get primary => const Color(0xFF0D47A1);
  Color get secondary => const Color(0xFFFFC107);

  Color get switchbackground => const Color(0xFF282827);

  Color get labelblack1 => const Color(0xFF1E1E1E);
  Color get labelblack2 => const Color(0xFF3D3D3B);
  Color get labelblack3 => const Color(0xFF4C4B50);
  Color get labelblack4 => const Color(0xFF6E6E6E);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colorsApp => ColorsApp.instance;
}
