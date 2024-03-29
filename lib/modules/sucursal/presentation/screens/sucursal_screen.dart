import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportes_app/config/app_init.dart';
import 'package:transportes_app/config/app_theme.dart';
import 'package:transportes_app/modules/providers/sucursales_provider.dart';
import 'package:transportes_app/modules/providers/system_provider.dart';
import 'package:transportes_app/modules/sucursal/domain/entities/sucursal.dart';
import 'package:transportes_app/modules/sucursal/presentation/widgets/card.dart';
import 'package:transportes_app/modules/sucursal/presentation/widgets/modal.dart';

class SucursalesScreen extends StatefulWidget {
  const SucursalesScreen({super.key});

  @override
  State<SucursalesScreen> createState() => _SucursalesScreenState();
}

class _SucursalesScreenState extends State<SucursalesScreen> {
  bool mostrarCards=false;
  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;

    //Providers
    final sucursales = context.watch<SucursalesProvider>();
    final systemProvider = context.watch<SystemProvider>();

    sucursales.getSursales();


    
    void cambiarColor(Color color){
    ThemeData newTheme = AppTheme(colorSeleccionado: AppTheme.colorList.indexOf(color)).getTheme();
    systemProvider.setTheme(newTheme);
  }
  
  void cerrarSesion(bool esCerrarSesion){
    //Hacer el cerrar sesion
  }

    return Scaffold(
      appBar: AppBar(title: const Text("Sucursales"),
      leading:  IconButton(
            onPressed: (){},
            icon: const Icon(Icons.menu)),
      backgroundColor: color.primary,
      foregroundColor: Colors.white,
      actions:[IconButton(
            onPressed: (){showColorPicker(context,AppTheme.colorList,cambiarColor);},
            icon: const Icon(Icons.color_lens)),
        IconButton(
            onPressed: (){showYesNoModal(context,color.primary,"¿Desea cerrar la sesion?",cerrarSesion,icon: Icons.mood_bad);},
            icon: const Icon(Icons.logout))],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        InputChip(label: mostrarCards?const Text("Card."):const Text('Tabla.'),onPressed: (){
          setState(() {
            mostrarCards=!mostrarCards;
          });
        },),
        mostrarCards?CardSucursal(sucursales: sucursales.sucursales,color: color.primary,): DataTableSucursal(color: color, sucursales: sucursales),
      ]),
    );
  }
}


class DataTableSucursal extends StatelessWidget {
  const DataTableSucursal({
    super.key,
    required this.color,
    required this.sucursales,
  });

  final ColorScheme color;
  final SucursalesProvider sucursales;

  @override
  Widget build(BuildContext context) {
    return DataTable(
                headingRowHeight: 20,
                dataRowMinHeight: 40,
                columnSpacing: 5,
                horizontalMargin: 10,
                headingRowColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
    return color.primary; 
                }),
                columns: const [
    DataColumn(
        label: Text('Código', style: TextStyle(color: Colors.white))),
    DataColumn(
        label: Text('Nombre', style: TextStyle(color: Colors.white))),
    DataColumn(
        label: Text('Municipio', style: TextStyle(color: Colors.white))),
    DataColumn(
        label: Text('Direccion', style: TextStyle(color: Colors.white))),
    DataColumn(
        label: Text('Acciones', style: TextStyle(color: Colors.white))),
                ],
                rows: List.generate(sucursales.sucursales.length, (index) {
    return DataRow(
      color: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          return index % 2 == 0 ? Colors.grey[200] : Colors.white;
        },
      ),
      cells: [
        DataCell(Text("${sucursales.sucursales[index].sucursalId}")),
        DataCell(Text(sucursales.sucursales[index].nombre)),
        DataCell(Text(sucursales.sucursales[index].nombreMunicipio)),
        DataCell(Text(sucursales.sucursales[index].direccion)),
        DataCell(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [IconButton(onPressed: (){}, icon: const Icon(Icons.edit),color: color.primary,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.red,)),
          ],)),
      ],
    );
                }),
              );
  }
}

class CardSucursal extends StatelessWidget {
  final List<Datum> sucursales;
  final Color color;
  const CardSucursal({super.key, required this.sucursales,required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(2.0),
            child: GridView.builder(
                itemCount: sucursales.length,
                padding: const EdgeInsets.symmetric(vertical: 36),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 5,
                  childAspectRatio: 3.58,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (BuildContext context, int index){
                    final item = sucursales[index];
                    return PersonalizeCard(
                    color: color,
                    title: "${item.nombre}\n${item.direccion}\n${item.nombreMunicipio}");
                  
                })
    );
  }
}