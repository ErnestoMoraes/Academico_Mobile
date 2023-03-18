// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension DailyStateSatusMatch on DailyStateSatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == DailyStateSatus.initial) {
      return initial();
    }

    if (v == DailyStateSatus.loading) {
      return loading();
    }

    if (v == DailyStateSatus.loaded) {
      return loaded();
    }

    if (v == DailyStateSatus.error) {
      return error();
    }

    throw Exception('DailyStateSatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == DailyStateSatus.initial && initial != null) {
      return initial();
    }

    if (v == DailyStateSatus.loading && loading != null) {
      return loading();
    }

    if (v == DailyStateSatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == DailyStateSatus.error && error != null) {
      return error();
    }

    return any();
  }
}
