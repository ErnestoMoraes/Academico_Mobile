// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:academico_mobile/app/models/schedule_model.dart';

part 'schedule_state.g.dart';

@match
enum ScheduleStatus {
  initial,
  loading,
  loaded,
  selectedDay,
  error,
}

class ScheduleState extends Equatable {
  final ScheduleStatus status;
  final List<CronogramaModel> schedule;
  final String? errorMessage;
  final int? selectedDay;

  const ScheduleState({
    required this.status,
    required this.schedule,
    this.errorMessage,
    this.selectedDay,
  });

  ScheduleState.initial()
      : status = ScheduleStatus.initial,
        schedule = <CronogramaModel>[],
        errorMessage = null,
        selectedDay = DateTime.now().weekday;

  @override
  List<Object?> get props => [status, schedule, errorMessage, selectedDay];

  ScheduleState copyWith({
    ScheduleStatus? status,
    List<CronogramaModel>? schedule,
    String? errorMessage,
    int? selectedDay,
  }) {
    return ScheduleState(
      status: status ?? this.status,
      schedule: schedule ?? this.schedule,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedDay: selectedDay ?? this.selectedDay,
    );
  }
}
