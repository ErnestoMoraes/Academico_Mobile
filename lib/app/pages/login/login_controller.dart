import 'dart:developer';
import 'package:academico_mobile/app/core/exceptions/unauthorized_exception.dart';
import 'package:academico_mobile/app/pages/login/login_state.dart';
import 'package:academico_mobile/app/repositories/auth/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String matricula, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.login(matricula, password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', authModel.accessToken);
      emit(state.copyWith(status: LoginStatus.sucess));
    } on UnauthorizedException catch (e, s) {
      log('Permissão Negada Controller 1', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: LoginStatus.loginError,
            errorMessage: 'Permissão Negada Controller 2'),
      );
    } catch (e, s) {
      log('Erro ao realizar Login Controller 1', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: LoginStatus.error,
            errorMessage: 'Erro ao realizar Login Controller 2'),
      );
    }
  }
}
