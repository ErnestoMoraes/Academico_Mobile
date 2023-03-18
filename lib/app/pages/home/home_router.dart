import 'package:academico_mobile/app/pages/home/home_controller.dart';
import 'package:academico_mobile/app/pages/home/home_page.dart';
import 'package:academico_mobile/app/repositories/home/home_repository.dart';
import 'package:academico_mobile/app/repositories/home/home_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<HomeRepository>(
            create: (context) => HomeRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => HomeController(
              context.read(),
            ),
          )
        ],
        child: const HomePage(),
      );
}
