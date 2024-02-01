import 'package:transportes_app/modules/sucursal/domain/entities/sucursal.dart';

abstract class SucursalRepository {
  Future<SucursalResponse> getSucursales();
}