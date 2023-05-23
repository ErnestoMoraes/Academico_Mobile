// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension SplashStatusMatch on SplashStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == SplashStatus.initial) {
      return initial();
    }

    if (v == SplashStatus.loading) {
      return loading();
    }

    if (v == SplashStatus.loaded) {
      return loaded();
    }

    if (v == SplashStatus.error) {
      return error();
    }

    throw Exception('SplashStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == SplashStatus.initial && initial != null) {
      return initial();
    }

    if (v == SplashStatus.loading && loading != null) {
      return loading();
    }

    if (v == SplashStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == SplashStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
