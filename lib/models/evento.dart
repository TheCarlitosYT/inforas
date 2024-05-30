import 'dart:convert';

class Evento {
    int? idEventos;
    String titulo;
    String tipoEvento;
    String? descripcion;
    String enlace;
    DateTime fecha;
    String lugar;

    Evento({
        this.idEventos,
        required this.titulo,
        required this.tipoEvento,
        this.descripcion,
        required this.enlace,
        required this.fecha,
        required this.lugar,
    });

    factory Evento.fromRawJson(String str) => Evento.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Evento.fromJson(Map<String, dynamic> json) => Evento(
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
