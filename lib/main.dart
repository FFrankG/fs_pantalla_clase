import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transportes_app/config/app_route.dart';
import 'package:transportes_app/config/app_theme.dart';
import 'package:transportes_app/config/override_http_certificate.dart';
import 'package:transportes_app/modules/providers/sucursales_provider.dart';
import 'package:transportes_app/modules/providers/system_provider.dart';
import 'package:transportes_app/modules/sucursal/data/sucursales_datasource.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                SucursalesProvider(sucursalRepo: SucursalesDataSource())),
        ChangeNotifierProvider(
            create: (_) =>
                SystemProvider(AppTheme(colorSeleccionado: 0).getTheme())),
      ],
      child: const MaterialApplication(),
    );
  }
}

class MaterialApplication extends StatelessWidget {
  const MaterialApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final systemProvider = context.watch<SystemProvider>();

    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: systemProvider.getTheme(),
    );
  }
}
