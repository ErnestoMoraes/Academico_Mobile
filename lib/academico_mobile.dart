import 'package:academico_mobile/app/core/provider/application_binding.dart';
import 'package:academico_mobile/app/core/ui/theme/theme_config.dart';
import 'package:academico_mobile/app/pages/daily/daily_router.dart';
import 'package:academico_mobile/app/pages/home/home_router.dart';
import 'package:academico_mobile/app/pages/login/login_router.dart';
import 'package:academico_mobile/app/pages/recover_password/recover_password_page.dart';
import 'package:academico_mobile/app/pages/request_documents/request_documents_page.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_router.dart';
import 'package:academico_mobile/app/pages/school_records/school_records_page.dart';
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
          '/login': (context) => LoginRouter.page,
          '/schedule': (context) => ScheduleRouter.page,
          '/daily': (context) => DailyRouter.page,
          '/home': (context) => HomeRouter.page,
          '/recover-password': (context) => const RecoverPasswordPage(),
          '/school_records': (context) => const SchoolRecordsPage(),
          '/request_documents': (context) => const RequestDocumentsPage(),
        },
      ),
    );
  }
}
