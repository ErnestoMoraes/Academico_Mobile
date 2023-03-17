import 'package:academico_mobile/app/core/provider/application_binding.dart';
import 'package:academico_mobile/app/core/ui/theme/theme_config.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_router.dart';
import 'package:academico_mobile/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AcademicoMobile extends StatelessWidget {
  const AcademicoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Academico Mobile',
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/schedule': (context) => ScheduleRouter.page,
        },
        
      ),
    );
  }
}
