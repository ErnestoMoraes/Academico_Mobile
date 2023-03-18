import 'package:academico_mobile/app/models/home_model.dart';

abstract class HomeRepository {
  Future<List<HomePageModel>> getHomePage();
}
