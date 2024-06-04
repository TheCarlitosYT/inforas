import 'dart:convert';

import 'package:inforas/services/login_service.dart';

class Evento {
    int? idEventos;
    String titulo;
    String tipoEvento;
    String formatoEvento;
    String? descripcion;
    String? enlace;
    DateTime fecha;
    String lugar;
    int idUsuario;

    Evento({
        this.idEventos,
        required this.titulo,
        required this.tipoEvento,
        required this.formatoEvento,
        this.descripcion,
        this.enlace,
        required this.fecha,
        required this.lugar,
        required this.idUsuario,
    });

    factory Evento.fromRawJson(String str) => Evento.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Evento.fromJson(Map<String, dynamic> json) => Evento(
        idEventos: json["id_eventos"],
        titulo: json["titulo"],
        tipoEvento: json["tipoEvento"],
        formatoEvento: json["formatoEvento"],
        descripcion: json["descripcion"],
        enlace: json["enlace"],
        fecha: DateTime.parse(json["fecha"]),
        lugar: json["lugar"],
        idUsuario: LoginService.usuario.id,
    );

    Map<String, dynamic> toJson() => {
        "id_eventos": idEventos,
        "titulo": titulo,
        "tipoEvento": tipoEvento,
        "formatoEvento": formatoEvento,
        "descripcion": descripcion,
        "enlace": enlace,
        "fecha": fecha.toIso8601String(),
        "lugar": lugar,
        "id_usuario": idUsuario,
    };
}
