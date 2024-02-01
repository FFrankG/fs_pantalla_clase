import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:transportes_app/modules/login/domain/dtos/login_peticion_dto.dart';
import 'package:transportes_app/modules/login/domain/entities/login_entity.dart';
import 'package:transportes_app/modules/login/domain/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<ClickEnBotonIngresar>((event, emit)async {
      emit(LoginLoading(mensaje: "Cargando..."));
      try{
        LoginResponse login = await repository.signIn(event.peticion);
        if(login.ok){
          emit(LoginSuccessfully(loginRespuesta: login.data));
          return;
        }
        emit(PeticionFailute(mensaje: login.mensaje));
      }
      catch(e){
        emit(PeticionFailute(mensaje: e.toString()));
      }
    });
    
  }
}
