import 'package:academico_mobile/app/models/daily_model.dart';

abstract class DailyRepository {
  Future<List<SemestreModel>> findDaily();
}