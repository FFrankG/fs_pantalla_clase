import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:transportes_app/common/widgets/date_widget.dart';
import 'package:transportes_app/config/app_init.dart';
import 'package:transportes_app/modules/login/bloc/login_bloc.dart';
import 'package:transportes_app/modules/login/domain/dtos/login_peticion_dto.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();
  bool ocultarContrasenia = true;
  DateTime _fechaInicial = DateTime.now();

  @override
  void initState() {
    super.initState();
    ocultarContrasenia = true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ColorScheme color = Theme.of(context).colorScheme;


    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginLoading){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.mensaje)));
        }
        if(state is LoginSuccessfully){
          AppInit.login(state.loginRespuesta);
          context.go("/sucursales");
        }
         if(state is PeticionFailute){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.mensaje)));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              backgroundColor: color.primary,
              title: const Text("Login Screen"),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: size.height * 0.25,
                        child: Image.asset('assets/farsiman.png',
                            width: size.width * .60)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height * 0.634,
                      decoration: BoxDecoration(
                        color: color.primary,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ruta Siman",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.05),
                              ),
                              const SizedBox(height: 20),
                              Form(
                                  key: _keyform,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _email,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "agregar texto";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            errorStyle: const TextStyle(
                                                color: Colors.white),
                                            filled: true,
                                            prefixIcon: const Icon(Icons.email),
                                            hintText: 'Ingrese su correo',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                borderSide: BorderSide(
                                                    color: color.primary)),
                                            fillColor: Colors.white,
                                            focusColor: Colors.white),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "agregar texto";
                                          }
                                          return null;
                                        },
                                        controller: _pass,
                                        obscureText: ocultarContrasenia,
                                        decoration: InputDecoration(
                                            errorStyle: const TextStyle(
                                                color: Colors.white),
                                            filled: true,
                                            prefixIcon: const Icon(
                                                Icons.security_outlined),
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    ocultarContrasenia =
                                                        !ocultarContrasenia;
                                                  });
                                                },
                                                icon: ocultarContrasenia
                                                    ? const Icon(Icons
                                                        .visibility_off_outlined)
                                                    : const Icon(
                                                        Icons.visibility)),
                                            hintText: 'Ingrese su contraseña',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                borderSide: BorderSide(
                                                    color: color.primary)),
                                            fillColor: Colors.white,
                                            focusColor: Colors.white),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      DateWidget(
                                        onCountChange: (fechaNueva) {
                                          _fechaInicial = fechaNueva;
                                          setState(() {});
                                        },
                                        dateInitial: _fechaInicial,
                                        label: '',
                                        inputDecoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: const OutlineInputBorder(),
                                            ),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                height: size.height * 0.007,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Olvidaste tu contraseña?",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  if (_keyform.currentState!.validate()) {
                                    _keyform.currentState!.save();
                                    var peticion =LoginPeticion(contrasena: _pass.text,correo: _email.text);
                                    BlocProvider.of<LoginBloc>(context).add(ClickEnBotonIngresar(peticion: peticion));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal:
                                          32.0), // Ajusta el padding según sea necesario
                                  textStyle: const TextStyle(
                                      fontSize:
                                          18.0), // Ajusta el tamaño del texto según sea necesario
                                ),
                                label: const Text("Sign In"),
                                icon: const Icon(Icons.login),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
