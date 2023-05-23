// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'splash_state.g.dart';

@match
enum SplashStatus {
  initial,
  loading,
  loaded,
  error,
}

class SplashState extends Equatable {
  final SplashStatus status;
  final String? errorMessage;

  const SplashState({
    required this.status,
    this.errorMessage,
  });
  const SplashState.initial()
      : status = SplashStatus.initial,
        errorMessage = null;

  @override
  List<Object?> get props => [status, errorMessage];

  SplashState copyWith({
    SplashStatus? status,
    String? errorMessage,
  }) {
    return SplashState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
