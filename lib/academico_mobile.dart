import 'package:academico_mobile/app/core/ui/theme/theme_config.dart';
import 'package:academico_mobile/app/pages/home/home_page.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_page.dart';
import 'package:academico_mobile/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AcademicoMobile extends StatelessWidget {
  const AcademicoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academico Mobile',
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/schedule': (context) => const SchedulePage(),
      },
    );
  }
}
