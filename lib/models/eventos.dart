import 'dart:convert';

class Asociacion {
    int idEventos;
    String titulo;
    String tipoEvento;
    String descripcion;
    String enlace;
    DateTime fecha;
    String lugar;

    Asociacion({
        required this.idEventos,
        required this.titulo,
        required this.tipoEvento,
        required this.descripcion,
        required this.enlace,
        required this.fecha,
        required this.lugar,
    });

    factory Asociacion.fromRawJson(String str) => Asociacion.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Asociacion.fromJson(Map<String, dynamic> json) => Asociacion(
        idEventos: json["id_eventos"],
        titulo: json["titulo"],
        tipoEvento: json["tipoEvento"],
        descripcion: json["descripcion"],
        enlace: json["enlace"],
        fecha: DateTime.parse(json["fecha"]),
        lugar: json["lugar"],
    );

    Map<String, dynamic> toJson() => {
        "id_eventos": idEventos,
        "titulo": titulo,
        "tipoEvento": tipoEvento,
        "descripcion": descripcion,
        "enlace": enlace,
        "fecha": fecha.toIso8601String(),
        "lugar": lugar,
    };
}
