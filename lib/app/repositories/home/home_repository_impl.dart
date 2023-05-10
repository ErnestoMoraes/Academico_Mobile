// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:academico_mobile/app/core/exceptions/repository_exceptions.dart';
import 'package:academico_mobile/app/core/rest_client/custom_dio.dart';
import 'package:academico_mobile/app/models/home_model.dart';
import 'package:dio/dio.dart';

import './home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final CustomDio dio;

  HomeRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<HomePageModel>> getHomePage() async {
    try {
      final result = await dio.auth().get('/homepage');
      return (result.data as List)
          .map((e) => HomePageModel.fromJson(e))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar dados da home', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar dados da home');
    }
  }
}
