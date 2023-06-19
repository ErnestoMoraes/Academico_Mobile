// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:academico_mobile/app/core/exceptions/repository_exceptions.dart';
import 'package:academico_mobile/app/core/rest_client/custom_dio.dart';
import 'package:academico_mobile/app/models/daily_model.dart';
import 'package:dio/dio.dart';

import './daily_repository.dart';

class DailyRepositoryImpl implements DailyRepository {
  final CustomDio dio;

  DailyRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<SemestreModel>> findDaily() async {
    try {
      final result = await dio.auth().get('/lista-disciplinas');
      final list = result.data as List;
      final semestres = list.map((e) => SemestreModel.fromJson(e)).toList();
      return semestres;
    } on DioError catch (e, s) {
      log('Erro ao buscar semestres', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar semestres');
    }
  }
}
