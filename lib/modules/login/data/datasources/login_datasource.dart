

import 'package:dio/dio.dart';
import 'package:transportes_app/modules/login/domain/dtos/login_peticion_dto.dart';
import 'package:transportes_app/modules/login/domain/entities/login_entity.dart';
import 'package:transportes_app/modules/login/domain/repositories/login_repository.dart';

class LoginDatasource implements LoginRepository {
  final Dio dio = Dio();
  final String baseUrl = 'https://192.168.56.1:45459/api';

  @override
  Future<LoginResponse> signIn(LoginPeticion peticion) async {
    try {
   
      String ruta="$baseUrl/Auth/Login/${peticion.correo}/${peticion.contrasena}";
      final response = await dio.post(ruta);
       final respMap= LoginResponse.fromJson(response.data);
      return respMap;
    } catch (e) {
      return Future.error(e);
    }
  }

}