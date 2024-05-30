import 'dart:convert';

class Documento {
    int? idDocumento;
    String tipoDocumentacion;
    String titulo;
    String? descripcion;
    String enlace;

    Documento({
        this.idDocumento,
        required this.tipoDocumentacion,
        required this.titulo,
        this.descripcion,
        required this.enlace,
    });

    factory Documento.fromRawJson(String str) => Documento.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Documento.fromJson(Map<String, dynamic> json) => Documento(
        idDocumento: json["id_documento"],
        tipoDocumentacion: json["tipoDocumentacion"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        enlace: json["enlace"],
    );

    Map<String, dynamic> toJson() => {
        "id_documento": idDocumento,
        "tipoDocumentacion": tipoDocumentacion,
        "titulo": titulo,
        "descripcion": descripcion,
        "enlace": enlace,
    };
}
