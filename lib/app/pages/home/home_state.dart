// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:academico_mobile/app/models/home_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<HomePageModel> homePage;
  final String? errorMessage;

  const HomeState({
    required this.status,
    required this.homePage,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        homePage = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, homePage, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<HomePageModel>? homePage,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      homePage: homePage ?? this.homePage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
