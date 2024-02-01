

import 'package:dio/dio.dart';
import 'package:transportes_app/config/app_environment.dart';
import 'package:transportes_app/modules/login/domain/dtos/login_peticion_dto.dart';
import 'package:transportes_app/modules/login/domain/entities/login_entity.dart';
import 'package:transportes_app/modules/login/domain/repositories/login_repository.dart';

class LoginDatasource implements LoginRepository {
  final Dio dio = Dio();

  @override
  Future<LoginResponse> signIn(LoginPeticion peticion) async {
    try {
   
      String ruta="${EnvironmentModel.urlApi}/Auth/Login/${peticion.correo}/${peticion.contrasena}";
      final response = await dio.post(ruta);
       final respMap= LoginResponse.fromJson(response.data);
      return respMap;
    } catch (e) {
      return Future.error(e);
    }
  }

}