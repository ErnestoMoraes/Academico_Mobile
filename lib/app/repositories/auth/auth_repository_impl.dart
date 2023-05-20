// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:academico_mobile/app/core/exceptions/repository_exceptions.dart';
import 'package:academico_mobile/app/core/exceptions/unauthorized_exception.dart';
import 'package:academico_mobile/app/core/rest_client/custom_dio.dart';
import 'package:academico_mobile/app/models/auth_model.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AuthModel> login(String matricula, String password) async {
    try {
      final response = await dio.auth().post(
        '/login',
        data: {'matricula': matricula, 'password': password},
      );
      final Map<String, dynamic> jsonData =
          response.data as Map<String, dynamic>;
      final String accessToken = jsonData['access_token'] as String;
      return accessToken.isNotEmpty
          ? AuthModel(accessToken: accessToken)
          : throw UnauthorizedException();
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Permissão Negada Repository 1', error: e, stackTrace: s);
        throw UnauthorizedException();
      }
      log('Erro ao realizar Login Repository', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao realizar Login Repository');
    }
  }
}
