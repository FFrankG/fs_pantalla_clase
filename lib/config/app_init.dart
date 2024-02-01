import 'package:transportes_app/modules/login/domain/entities/login_entity.dart';

class AppInit{
  static Data onUser= Data(usuarioId: 0, nombre: '', imagen: '', nombreRol: null, idRol: null, esAdmin: false);

  static login(Data user){
    onUser=user;
  }

}