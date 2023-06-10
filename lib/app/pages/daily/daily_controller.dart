// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:academico_mobile/app/core/config/sqlite/database.dart';
import 'package:academico_mobile/app/models/daily_model.dart';
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
      DatabaseGlobal data = DatabaseGlobal();
      List<SemestreModel> semestres = await data.getAllSemestres();
      if (semestres.isEmpty) {
        semestres = await _dailyRepository.findDaily();
        for (SemestreModel semestre in semestres) {
          await data.saveSemestre(semestre);
        }
      }
      emit(
        state.copyWith(status: DailyStateSatus.loaded, semestres: semestres),
      );
    } catch (e, s) {
      log('Erro ao buscar semestres', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: DailyStateSatus.error,
          errorMessage: 'Erro ao buscar semestres',
        ),
      );
    }
  }

  Future<void> reload() async {
    emit(state.copyWith(status: DailyStateSatus.loading));
    try {
      DatabaseGlobal data = DatabaseGlobal();
      List<SemestreModel> semestres = [];
      semestres = await _dailyRepository.findDaily();
      await data.deleteAllData();
      for (SemestreModel semestre in semestres) {
        await data.saveSemestre(semestre);
      }
      emit(
        state.copyWith(status: DailyStateSatus.loaded, semestres: semestres),
      );
    } catch (e, s) {
      log('Erro ao buscar semestres', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: DailyStateSatus.error,
          errorMessage: 'Erro ao buscar semestres',
        ),
      );
    }
  }

  Future<void> cleanAll() async {
    emit(state.copyWith(status: DailyStateSatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      DatabaseGlobal data = DatabaseGlobal();
      List<SemestreModel> semestres = [];
      await data.deleteAllData();
      emit(
        state.copyWith(status: DailyStateSatus.loaded, semestres: semestres),
      );
    } catch (e, s) {
      log('Erro ao buscar semestres', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: DailyStateSatus.error,
          errorMessage: 'Erro ao buscar semestres',
        ),
      );
    }
  }

  void changeIsNow() async {
    emit(state.copyWith(status: DailyStateSatus.loading));
    await Future.delayed(
      const Duration(milliseconds: 700),
    );
    emit(
      state.copyWith(
        status: DailyStateSatus.loaded,
        isNow: !state.isNow,
      ),
    );
  }

  Future<void> selectedDay(int index) async {
    emit(state.copyWith(status: DailyStateSatus.loading));
    await Future.delayed(const Duration(milliseconds: 700));
    emit(state.copyWith(status: DailyStateSatus.loaded, selected: index));
  }
}
