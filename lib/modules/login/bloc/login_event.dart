part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ClickEnBotonIngresar extends LoginEvent{
  final LoginPeticion peticion;
  ClickEnBotonIngresar({required this.peticion});
}
