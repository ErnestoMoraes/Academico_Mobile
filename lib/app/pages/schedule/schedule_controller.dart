import 'dart:developer';

import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_state.dart';
import 'package:academico_mobile/app/repositories/schedule/schedule_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ScheduleController extends Cubit<ScheduleState> {
  final ScheduleRepository _scheduleRepository;

  ScheduleController(this._scheduleRepository) : super(ScheduleState.initial());

  Future<void> loadSchedule() async {
    emit(state.copyWith(status: ScheduleStatus.loading));
    try {
      // final schedule = await _scheduleRepository.findSchedule();
      late Box box;
      List<Horario> schedule = [];
      box = await Hive.openBox('schedule_box');
      if (box.isEmpty) {
        debugPrint('box vazio');
        schedule = await _scheduleRepository.findSchedule();
        await box.put(
            'schedules', schedule.map((horario) => horario.toJson()).toList());
      } else {
        final dynamicList = box.get('schedules');
        schedule = dynamicList
            .map((dynamicItem) =>
                Horario.fromJson(dynamicItem))
            .toList();
        for (final horario in schedule) {
          debugPrint('ID: ${horario.id}');
          debugPrint('Dia: ${horario.dia}');
          debugPrint('Horarios: ${horario.horarios}');
          debugPrint('-----');
        }
      }
      // schedule = dynamicList
      //     .map((dynamicItem) =>
      //         Horario.fromJson(dynamicItem))
      //     .toList();
      // debugPrint('box cheio: $schedule');
      // await box.put('schedule_box',
      //     schedule.map((horario) => horario.toJson()).toList());

      emit(state.copyWith(status: ScheduleStatus.loaded, schedule: []));
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
