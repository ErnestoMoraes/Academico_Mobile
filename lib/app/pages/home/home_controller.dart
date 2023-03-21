import 'dart:developer';

import 'package:academico_mobile/app/pages/home/home_state.dart';
import 'package:academico_mobile/app/repositories/home/home_repository.dart';
import 'package:bloc/bloc.dart';

class HomeController extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository) : super(const HomeState.initial());

  Future<void> loadHomePage() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final homePage = await _homeRepository.getHomePage();
      emit(state.copyWith(
          status: HomeStateStatus.loaded, homePage: homePage, isOn: true));
    } catch (e, s) {
      log('Error ao carregar home page', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          isOn: false,
          errorMessage: 'Error ao carregar home page'));
    }
  }
}
