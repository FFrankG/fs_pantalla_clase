import 'package:dio/dio.dart';
import 'package:transportes_app/modules/sucursal/domain/entities/sucursal.dart';
import 'package:transportes_app/modules/sucursal/domain/repositories/sucursal_repository.dart';

class SucursalesDataSource implements SucursalRepository {
  final Dio dio = Dio();
  final String baseUrl = 'https://192.168.56.1:45459/api';
  @override
  Future<SucursalResponse> getSucursales() async {
    try {
   
      String ruta="$baseUrl/sucursal/Listar";
      final response = await dio.get(ruta);
       final respMap= SucursalResponse.fromJson(response.data);
      return respMap;
    } catch (e) {
      return Future.error(e);
    }
  }
  
}