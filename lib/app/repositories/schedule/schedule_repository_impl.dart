import 'package:academico_mobile/app/core/config/env/env.dart';
import 'package:academico_mobile/app/core/exceptions/repository_exceptions.dart';
import 'package:academico_mobile/app/core/rest_client/custom_webview.dart';

import './schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final CustomWebview webview;
  ScheduleRepositoryImpl({
    required this.webview,
  });

  @override
  Future<void> findSchedule() async {
    // try {
    //   var result = await webview
    //       .unauth()
    //       .loadRequest(Uri.parse(Env.instance['URL_SCHECULE'] ?? ''));
    // } on Exception catch (e) {
    //   throw RepositoryExceptions(e.toString());
    // }
  }
}
