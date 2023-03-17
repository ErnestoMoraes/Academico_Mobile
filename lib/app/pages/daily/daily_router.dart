import 'package:academico_mobile/app/pages/daily/daily_controller.dart';
import 'package:academico_mobile/app/pages/daily/daily_page.dart';
import 'package:academico_mobile/app/repositories/daily/daily_repository.dart';
import 'package:academico_mobile/app/repositories/daily/daily_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DailyRouter {
  DailyRouter._();
  static Widget get page => MultiBlocProvider(
        providers: [
          Provider<DailyRepository>(
            create: (context) => DailyRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => DailyController(context.read()),
          ),
        ],
        child: const DailyPage(),
      );
}
