import 'package:flutter/material.dart';

class AppTheme {
  final int colorSeleccionado;

  static List<Color> colorList=  [
    Colors.blue,
    const Color.fromARGB(223, 70, 6, 159),
    Colors.teal,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.deepPurple
  ];
 AppTheme({
  this.colorSeleccionado=0
 });

  ThemeData getTheme()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[colorSeleccionado],
    appBarTheme: const AppBarTheme(centerTitle: false)
  );
}