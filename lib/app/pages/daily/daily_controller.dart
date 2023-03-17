// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:academico_mobile/app/pages/daily/daily_state.dart';
import 'package:academico_mobile/app/repositories/daily/daily_repository.dart';

class DailyController extends Cubit<DailyState> {
  final DailyRepository _dailyRepository;

  DailyController(
    this._dailyRepository,
  ) : super(DailyState.initial());

  Future<void> loadSemestre() async {
    emit(state.copyWith(status: DailyStateSatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final semestres = await _dailyRepository.findDaily();
      emit(state.copyWith(
        status: DailyStateSatus.loaded,
        semestres: semestres,
      ));
    } catch (e, s) {
      log('Erro ao buscar semestres', error: e, stackTrace: s);
      emit(state.copyWith(
        status: DailyStateSatus.error,
        errorMessage: 'Erro ao buscar semestres',
      ));
    }
  }
}
