part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{
  final String mensaje;

  LoginLoading({required this.mensaje});
}
class LoginSuccessfully extends LoginState {
  final Data loginRespuesta;

  LoginSuccessfully({required this.loginRespuesta});

}

class PeticionFailute extends LoginState {
  final String mensaje;

  PeticionFailute({required this.mensaje});

}

