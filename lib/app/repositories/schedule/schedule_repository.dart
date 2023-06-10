
import 'package:academico_mobile/app/models/schedule_model.dart';

abstract class ScheduleRepository {
  Future<List<CronogramaModel>> findSchedule();
}
