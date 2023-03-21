// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:academico_mobile/app/models/daily_model.dart';

part 'daily_state.g.dart';

@match
enum DailyStateSatus {
  initial,
  loading,
  loaded,
  isNow,
  selected,
  error,
}

class DailyState extends Equatable {
  final DailyStateSatus status;
  final List<SemestreModel> semestres;
  final String? errorMessage;
  final bool isNow;
  final int selected;

  const DailyState({
    required this.status,
    required this.semestres,
    this.errorMessage,
    this.isNow = true,
    this.selected = 0,
  });

  DailyState.initial()
      : status = DailyStateSatus.initial,
        semestres = [],
        errorMessage = null,
        isNow = true,
        selected = 0;

  @override
  List<Object?> get props => [status, semestres, errorMessage, isNow, selected];

  DailyState copyWith({
    DailyStateSatus? status,
    List<SemestreModel>? semestres,
    String? errorMessage,
    bool? isNow,
    int? selected,
  }) {
    return DailyState(
      status: status ?? this.status,
      semestres: semestres ?? this.semestres,
      errorMessage: errorMessage ?? this.errorMessage,
      isNow: isNow ?? this.isNow,
      selected: selected ?? this.selected,
    );
  }
}
