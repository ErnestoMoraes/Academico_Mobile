import 'package:academico_mobile/app/pages/schedule/schedule_controller.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_page.dart';
import 'package:academico_mobile/app/repositories/schedule/schedule_repository.dart';
import 'package:academico_mobile/app/repositories/schedule/schedule_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleRouter {
  ScheduleRouter._();
  static Widget get page => MultiProvider(
        providers: [
          Provider<ScheduleRepository>(
            create: (context) => ScheduleRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => ScheduleController(
              context.read(),
            ),
          ),
        ],
        child: const SchedulePage(),
      );
}
