import 'dart:convert';

class Login {
  int? id;
  String username;
  String nombre;
  String apellidos;
  String password;
  List<String> roles;
  String tokenType;
  String accessToken;

  Login({
    this.id,
    required this.username,
    required this.nombre,
    required this.apellidos,
    required this.password,
    required this.roles,
    required this.tokenType,
    required this.accessToken,
  });

  factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        username: json["username"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        password: json["password"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        tokenType: json["tokenType"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nombre": nombre,
        "apellidos": apellidos,
        "password": password,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "tokenType": tokenType,
        "accessToken": accessToken,
      };
}
