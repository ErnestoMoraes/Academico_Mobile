
import 'package:academico_mobile/app/models/my_schedule/schedule_model.dart';

abstract class ScheduleRepository {
  Future<ScheduleModel> findSchedule();
}
