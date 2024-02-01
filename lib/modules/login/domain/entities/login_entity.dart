

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    bool ok;
    String codigo;
    String mensaje;
    Data data;

    LoginResponse({
        required this.ok,
        required this.codigo,
        required this.mensaje,
        required this.data,
    });

    LoginResponse copyWith({
        bool? ok,
        String? codigo,
        String? mensaje,
        Data? data,
    }) => 
        LoginResponse(
            ok: ok ?? this.ok,
            codigo: codigo ?? this.codigo,
            mensaje: mensaje ?? this.mensaje,
            data: data ?? this.data,
        );

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        codigo: json["codigo"],
        mensaje: json["mensaje"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "codigo": codigo,
        "mensaje": mensaje,
        "data": data.toJson(),
    };
}

class Data {
    int usuarioId;
    String nombre;
    String imagen;
    dynamic idRol;
    dynamic nombreRol;
    bool esAdmin;

    Data({
        required this.usuarioId,
        required this.nombre,
        required this.imagen,
        required this.idRol,
        required this.nombreRol,
        required this.esAdmin,
    });

    Data copyWith({
        int? usuarioId,
        String? nombre,
        String? imagen,
        dynamic idRol,
        dynamic nombreRol,
        bool? esAdmin,
    }) => 
        Data(
            usuarioId: usuarioId ?? this.usuarioId,
            nombre: nombre ?? this.nombre,
            imagen: imagen ?? this.imagen,
            idRol: idRol ?? this.idRol,
            nombreRol: nombreRol ?? this.nombreRol,
            esAdmin: esAdmin ?? this.esAdmin,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        usuarioId: json["usuarioId"],
        nombre: json["nombre"],
        imagen: json["imagen"],
        idRol: json["idRol"],
        nombreRol: json["nombreRol"],
        esAdmin: json["esAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "nombre": nombre,
        "imagen": imagen,
        "idRol": idRol,
        "nombreRol": nombreRol,
        "esAdmin": esAdmin,
    };
}
