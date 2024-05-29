// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:sico_project/models/models.dart';
// import 'package:sico_project/providers/transita_provider.dart';
// import 'package:sico_project/services/login_service.dart';

// class ClienteService extends ChangeNotifier {
//   late Cliente clientData;
//   List<Cliente> clientUsername = [];

//   Future<String> registerClient(Map<String, dynamic> data) async {
//     String username = data['username'];
//     String password = data['password'];
//     String nombre = data['nombre'];
//     String apellidos = data['apellidos'];

//     Map<String, dynamic> newData = {
//       'estado': 'ACTIVO',
//       'username': username,
//       'password': password,
//       'nombre': nombre,
//       'apellidos': apellidos,
//       'role': ['user']
//     };
//     print('Registrar Cliente');
//     print(newData);

//     final newJsonData =
//         await TransitaProvider.postJsonData('/api/auth/signup', newData);

//     try {
//       clientData = Cliente.fromJson(json.decode(newJsonData));
//       notifyListeners();
//       return newJsonData;
//     } catch (error) {
//       print('Error decodeando JSON response: $error');
//       return 'Error decodeando JSON response';
//     }
//   }

//   Future<List<Cliente>> getUsernameClients() async {
//     final jsonData = await TransitaProvider.getJsonData('/clientes');

//     try {
//       clientUsername = jsonData.map((json) => Cliente.fromJson(json)).toList();
//       notifyListeners();
//       return clientUsername;
//     } catch (error) {
//       print('Error al obtener el HTTP GET EMAILS');
//       return clientUsername = [];
//     }
//   }

//   Future<Cliente> getUserById() async {
//     final jsonData = await TransitaProvider.getJsonData(
//         'clientes/${LoginService.usuario.id}');

//     try {
//       Cliente cliente = Cliente.fromJson(jsonData as Map<String, dynamic>);
//       notifyListeners();
//       return cliente;
//     } catch (error) {
//       throw error;
//     }
//   }

//   Future<String> sendCodeToRecovery(Map<String, dynamic> data) async {
//     final jsonData =
//         await TransitaProvider.postJsonData('/api/auth/pswRecovery', data);
//     print('Respuesta del servidor: $jsonData');
//     try {
//       var decodedJson = json.decode(jsonData);
//       String username = decodedJson['username'];
//       print(username);
//       notifyListeners();
//       return username;
//     } catch (error) {
//       print('Error decodeando JSON response sendCodeToRecovery: $error');
//       return 'Error decodeando JSON response';
//     }
//   }

//   Future<String> verifyCode(Map<String, dynamic> data) async {
//     final jsonData =
//         await TransitaProvider.postJsonData('/api/auth/verifyCode', data);

//     try {
//       var decodedJson = json.decode(jsonData);
//       String message = decodedJson['message'];
//       notifyListeners();
//       return message;
//     } catch (error) {
//       print('Error decodeando JSON response: $error');
//       return 'Error decodeando JSON response';
//     }
//   }

//   Future<String> changePassword(Map<String, dynamic> data) async {
//     final jsonData =
//         await TransitaProvider.postJsonData('/api/auth/resetPassword', data);

//     try {
//       var decodedJson = json.decode(jsonData);
//       String message = decodedJson['message'];
//       notifyListeners();
//       return message;
//     } catch (error) {
//       print('Error decodeando JSON response: $error');
//       return 'Error decodeando JSON response';
//     }
//   }

//   Future<String> updateClientData(Map<String, dynamic> data) async {
//     final jsonData = await TransitaProvider.putJsonData(
//         '/clientes/${LoginService.usuario.id}/logged', data);

//     print('jsonData URL --> /clientes/${LoginService.usuario.id}/logged  DATA --> $jsonData');
//     try {
//       var decodedJson = json.decode(jsonData);
//       print('Json decoded --> $decodedJson');
//       //String message = decodedJson['message'];
//       //print('Mensaje del jsonDecoded --> $message');
//       notifyListeners();
//       //print('message de respuesta $message');
//       return 'test';
//     } catch (error) {
//       print('Error en updateClienteData');
//       print('Error decodeando JSON response: $error');
//       return 'Error decodeando JSON response';
//     }
//   }

//   Future<String> changePasswordWithoutCode(Map<String, dynamic> data) async {
//     final jsonData = await TransitaProvider.putJsonData(
//         '/clientes/${LoginService.usuario.id}/password', data);

//     try {
//       var decodedJson = json.decode(jsonData);
//       String message = decodedJson['message'];
//       notifyListeners();
//       return message;
//     } catch (error) {
//       print('Error decodeando JSON response: $error');
//       return 'Error decodeando JSON response';
//     }
//   }
// }
