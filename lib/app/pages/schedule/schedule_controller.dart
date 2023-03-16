import 'dart:developer';

import 'package:academico_mobile/app/pages/schedule/schedule_state.dart';
import 'package:academico_mobile/app/repositories/schedule/schedule_repository.dart';
import 'package:bloc/bloc.dart';

class ScheduleController extends Cubit<ScheduleState> {
  final ScheduleRepository _scheduleRepository;

  ScheduleController(this._scheduleRepository) : super(ScheduleState.initial());

  Future<void> loadSchedule() async {
    emit(state.copyWith(status: ScheduleStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final schedule = await _scheduleRepository.findSchedule();
      emit(state.copyWith(status: ScheduleStatus.loaded, schedule: schedule));
    } catch (e, s) {
      log('Erro ao carregar o cronograma', error: e, stackTrace: s);
      emit(state.copyWith(status: ScheduleStatus.error, errorMessage: 'Erro ao carregar o cronograma'));
    }
  }
}
