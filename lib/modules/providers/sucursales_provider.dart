import 'package:flutter/widgets.dart';
import 'package:transportes_app/modules/sucursal/domain/entities/sucursal.dart';
import 'package:transportes_app/modules/sucursal/domain/repositories/sucursal_repository.dart';

class SucursalesProvider extends ChangeNotifier {
final SucursalRepository sucursalRepo;
List<Datum> sucursales=[];
String mensaje="";

  SucursalesProvider({required this.sucursalRepo});

getSursales()async {

  var getSucursal= await sucursalRepo.getSucursales();

  if(getSucursal.ok){
    sucursales=getSucursal.data;
  }else{
  mensaje=getSucursal.mensaje;
  }

  notifyListeners();
}

  
}