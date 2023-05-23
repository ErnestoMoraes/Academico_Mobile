import 'package:academico_mobile/app/models/home_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';
part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  deslogado,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<HomePageModel> homePage;
  final String? errorMessage;
  final bool isOn;

  const HomeState({
    required this.status,
    required this.homePage,
    this.errorMessage,
    required this.isOn,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        homePage = const [],
        errorMessage = null,
        isOn = false;

  @override
  List<Object?> get props => [status, homePage, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<HomePageModel>? homePage,
    String? errorMessage,
    bool? isOn,
  }) {
    return HomeState(
      status: status ?? this.status,
      homePage: homePage ?? this.homePage,
      errorMessage: errorMessage ?? this.errorMessage,
      isOn: isOn ?? this.isOn,
    );
  }
}
