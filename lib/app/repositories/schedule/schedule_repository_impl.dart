// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:academico_mobile/app/core/exceptions/repository_exceptions.dart';
import 'package:academico_mobile/app/core/rest_client/custom_dio.dart';
import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:dio/dio.dart';

import './schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final CustomDio dio;

  ScheduleRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<Horario>> findSchedule() async {
    try {
      final result = await dio.unauth().get('/horarios');
      return (result.data as List)
          .map((e) => Horario.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar horários', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar horários');
    }
  }
}
