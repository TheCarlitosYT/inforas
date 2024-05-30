import 'dart:convert';

class Asociacion {
    int? idAsociacion;
    String nombre;
    String? descripcion;

    Asociacion({
        this.idAsociacion,
        required this.nombre,
        this.descripcion,
    });

    factory Asociacion.fromRawJson(String str) => Asociacion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Asociacion.fromJson(Map<String, dynamic> json) => Asociacion(
        idAsociacion: json["id_Asociacion"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id_Asociacion": idAsociacion,
        "nombre": nombre,
        "descripcion": descripcion,
    };
}
