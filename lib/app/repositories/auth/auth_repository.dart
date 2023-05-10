import 'package:academico_mobile/app/models/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> login(String matricula, String password);
}
