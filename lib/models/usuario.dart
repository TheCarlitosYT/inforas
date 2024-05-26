import 'dart:convert';

class Usuario {
    int? idUsuario;
    String estado;
    String username;
    String password;
    String nombre;
    String apellidos;

    Usuario({
        this.idUsuario,
        required this.estado,
        required this.username,
        required this.password,
        required this.nombre,
        required this.apellidos,
    });

    factory Usuario.fromRawJson(String str) => Usuario.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["id_usuario"],
        estado: json["estado"],
        username: json["username"],
        password: json["password"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
    );

    Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "estado": estado,
        "username": username,
        "password": password,
        "nombre": nombre,
        "apellidos": apellidos,
    };
}
