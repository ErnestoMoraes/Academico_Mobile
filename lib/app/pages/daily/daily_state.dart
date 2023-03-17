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
  error,
}

class DailyState extends Equatable {
  final DailyStateSatus status;
  final List<SemestreModel> semestres;
  final String? errorMessage;

  const DailyState({
    required this.status,
    required this.semestres,
    this.errorMessage,
  });

  DailyState.initial()
      : status = DailyStateSatus.initial,
        semestres = [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, semestres, errorMessage];

  DailyState copyWith({
    DailyStateSatus? status,
    List<SemestreModel>? semestres,
    String? errorMessage,
  }) {
    return DailyState(
      status: status ?? this.status,
      semestres: semestres ?? this.semestres,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
