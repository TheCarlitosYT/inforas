import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inforas/models/login.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  final String _keyUserId = 'userId';
  final String _keyUsername = 'username';
  final String _keyNombre = 'nombre';
  final String _keyApellidos = 'apellidos';

  Future<void> storeUserData(Login usuario) async {
    await _storage.write(key: _keyUserId, value: usuario.id.toString());
    await _storage.write(key: _keyUsername, value: usuario.username);
    await _storage.write(key: _keyNombre, value: usuario.nombre);
    await _storage.write(key: _keyApellidos, value: usuario.apellidos);
  }

  Future<void> setUserId(int id) async {
    await _storage.write(key: _keyUserId, value: id.toString());
  }

  Future<void> setUsername(String username) async {
    await _storage.write(key: _keyUsername, value: username);
  }

  Future<void> setNombre(String nombre) async {
    await _storage.write(key: _keyNombre, value: nombre);
  }

  Future<void> setApellidos(String apellidos) async {
    await _storage.write(key: _keyApellidos, value: apellidos);
  }

  Future<int?> getUserId() async {
    String? id = await _storage.read(key: _keyUserId);
    return id != null ? int.tryParse(id) : null;
  }

  Future<String?> getUsername() async {
    return await _storage.read(key: _keyUsername);
  }

  Future<String?> getNombre() async {
    return await _storage.read(key: _keyNombre);
  }

  Future<String?> getApellidos() async {
    return await _storage.read(key: _keyApellidos);
  }
}