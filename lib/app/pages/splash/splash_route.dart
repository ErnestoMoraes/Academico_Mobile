import 'package:academico_mobile/app/pages/splash/splash_controller.dart';
import 'package:academico_mobile/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashRoute {
  SplashRoute._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<SplashController>(
            create: (context) => SplashController(
              context.read(),
            ),
          ),
        ],
        child: const SplashPage(),
      );
}
