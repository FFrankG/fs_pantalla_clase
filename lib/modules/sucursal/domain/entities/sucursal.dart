
import 'dart:convert';

SucursalResponse sucursalResponseFromJson(String str) => SucursalResponse.fromJson(json.decode(str));

String sucursalResponseToJson(SucursalResponse data) => json.encode(data.toJson());

class SucursalResponse {
    bool ok;
    String codigo;
    String mensaje;
    List<Datum> data;

    SucursalResponse({
        required this.ok,
        required this.codigo,
        required this.mensaje,
        required this.data,
    });

    SucursalResponse copyWith({
        bool? ok,
        String? codigo,
        String? mensaje,
        List<Datum>? data,
    }) => 
        SucursalResponse(
            ok: ok ?? this.ok,
            codigo: codigo ?? this.codigo,
            mensaje: mensaje ?? this.mensaje,
            data: data ?? this.data,
        );

    factory SucursalResponse.fromJson(Map<String, dynamic> json) => SucursalResponse(
        ok: json["ok"],
        codigo: json["codigo"],
        mensaje: json["mensaje"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "codigo": codigo,
        "mensaje": mensaje,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int sucursalId;
    String nombre;
    String direccion;
    int municipioId;
    String nombreMunicipio;

    Datum({
        required this.sucursalId,
        required this.nombre,
        required this.direccion,
        required this.municipioId,
        required this.nombreMunicipio,
    });

    Datum copyWith({
        int? sucursalId,
        String? nombre,
        String? direccion,
        int? municipioId,
        String? nombreMunicipio,
    }) => 
        Datum(
            sucursalId: sucursalId ?? this.sucursalId,
            nombre: nombre ?? this.nombre,
            direccion: direccion ?? this.direccion,
            municipioId: municipioId ?? this.municipioId,
            nombreMunicipio: nombreMunicipio ?? this.nombreMunicipio,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        sucursalId: json["sucursalId"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        municipioId: json["municipioId"],
        nombreMunicipio: json["nombreMunicipio"],
    );

    Map<String, dynamic> toJson() => {
        "sucursalId": sucursalId,
        "nombre": nombre,
        "direccion": direccion,
        "municipioId": municipioId,
        "nombreMunicipio": nombreMunicipio,
    };
}
