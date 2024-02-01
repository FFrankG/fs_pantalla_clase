import 'package:transportes_app/modules/login/domain/dtos/login_peticion_dto.dart';
import 'package:transportes_app/modules/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginResponse> signIn(LoginPeticion peticion);
}