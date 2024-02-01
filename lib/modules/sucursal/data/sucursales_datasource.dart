import 'package:dio/dio.dart';
import 'package:transportes_app/config/app_environment.dart';
import 'package:transportes_app/modules/sucursal/domain/entities/sucursal.dart';
import 'package:transportes_app/modules/sucursal/domain/repositories/sucursal_repository.dart';

class SucursalesDataSource implements SucursalRepository {
  final Dio dio = Dio();
  
  @override
  Future<SucursalResponse> getSucursales() async {
    try {
   
      String ruta="${EnvironmentModel.urlApi}/sucursal/Listar";
      final response = await dio.get(ruta);
       final respMap= SucursalResponse.fromJson(response.data);
      return respMap;
    } catch (e) {
      return Future.error(e);
    }
  }
  
}