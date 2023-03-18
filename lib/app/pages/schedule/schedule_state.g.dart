// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension ScheduleStatusMatch on ScheduleStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == ScheduleStatus.initial) {
      return initial();
    }

    if (v == ScheduleStatus.loading) {
      return loading();
    }

    if (v == ScheduleStatus.loaded) {
      return loaded();
    }

    if (v == ScheduleStatus.error) {
      return error();
    }

    throw Exception('ScheduleStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == ScheduleStatus.initial && initial != null) {
      return initial();
    }

    if (v == ScheduleStatus.loading && loading != null) {
      return loading();
    }

    if (v == ScheduleStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == ScheduleStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
