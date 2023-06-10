import 'dart:developer';
import 'package:academico_mobile/app/core/config/sqlite/database.dart';
import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_state.dart';
import 'package:academico_mobile/app/repositories/schedule/schedule_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ScheduleController extends Cubit<ScheduleState> {
  final ScheduleRepository _scheduleRepository;

  ScheduleController(this._scheduleRepository) : super(ScheduleState.initial());

  Future<void> loadSchedule() async {
    emit(state.copyWith(status: ScheduleStatus.loading));
    try {
      DatabaseGlobal data = DatabaseGlobal();
      debugPrint('ponto 1...');
      List<CronogramaModel> cronograma = await data.getAllCronograma();
      debugPrint('ponto 2...');
      if (cronograma.isEmpty) {
        debugPrint('ponto 3...');
        cronograma = await _scheduleRepository.findSchedule();
        for (CronogramaModel horario in cronograma) {
          await data.saveHorario(horario);
        }
      }
      debugPrint('ponto 4...');
      emit(state.copyWith(status: ScheduleStatus.loaded, schedule: cronograma));
    } catch (e, s) {
      log('Erro ao carregar o cronograma', error: e, stackTrace: s);
      emit(state.copyWith(
          status: ScheduleStatus.error,
          errorMessage: 'Erro ao carregar o cronograma'));
    }
  }

  Future<void> selectedDay(int day) async {
    emit(state.copyWith(status: ScheduleStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: ScheduleStatus.loaded, selectedDay: day));
  }
}
