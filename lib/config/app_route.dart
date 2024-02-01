import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transportes_app/modules/login/bloc/login_bloc.dart';
import 'package:transportes_app/modules/login/data/datasources/login_datasource.dart';
import 'package:transportes_app/modules/login/presentation/screens/login.dart';
import 'package:transportes_app/modules/menu/presentation/screens/page_list.dart';
import 'package:transportes_app/modules/sucursal/presentation/screens/sucursal_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'Login',
      builder: (context, state) =>  BlocProvider(
        create: (context) => LoginBloc(repository: LoginDatasource()),
        child: const LoginScreen(),
      ),
      ),
      GoRoute(
      path: '/menu',
      name: 'Menu',
      builder: (context, state) =>  const MenuScreen(),
      ),
       GoRoute(
      path: '/sucursales',
      name: 'sucursales',
      builder: (context, state) =>  const SucursalesScreen(),
      ),
  ]);