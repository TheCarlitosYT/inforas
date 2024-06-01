import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inforas/providers/inforas_provider.dart';
import 'package:inforas/models/models.dart';

class LoginService extends ChangeNotifier {
  static late Login usuario;
  final storage = new FlutterSecureStorage();

  Future<String> login(Map<String, dynamic> data) async {
    final jsonData =
        await InforasProvider.postJsonData('/api/auth/signin', data);

    try {
      usuario = Login.fromJson(json.decode(jsonData));
      InforasProvider.apiKey = '${usuario.tokenType} ${usuario.accessToken}';
      await storage.write(
          key: 'idStorageToken', value: InforasProvider.apiKey);
      await storage.write(key: 'username', value: usuario.username);
      await storage.write(key: 'id', value: usuario.id.toString());
      await storage.write(key: 'nombre', value: usuario.nombre);
      await storage.write(key: 'apellidos', value: usuario.apellidos);
      notifyListeners();
      return jsonData;
    } catch (error) {
      print('Error decodeando JSON response: $error');
      return 'Error decodeando JSON response';
    }
  }

  Future<String> isAuthenticated() async {
    print(storage);
    return await storage.read(key: 'idStorageToken') ?? '';
  }

  Future logout() async {
    print(InforasProvider.apiKey);
    print(storage);
    await storage.deleteAll();
    return 'LogOut Correctamente';
  }
}
