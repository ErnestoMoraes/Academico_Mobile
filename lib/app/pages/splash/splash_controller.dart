import 'dart:developer';
import 'package:academico_mobile/app/pages/splash/splash_state.dart';
import 'package:academico_mobile/app/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends Cubit<SplashState> {
  final AuthRepository _authRepository;
  SplashController(this._authRepository) : super(const SplashState.initial());

  Future<void> splashLogin(String matricula, String password) async {
    emit(state.copyWith(status: SplashStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final authModel = await _authRepository.login(matricula, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', authModel.accessToken);

      emit(state.copyWith(status: SplashStatus.loaded));
    } catch (e, s) {
      log('Erro ao realizar Login Controller 1', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: SplashStatus.error,
            errorMessage: 'Erro ao realizar Login Controller 2'),
      );
    }
  }
}
