import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inforas/models/documento.dart';
import 'package:inforas/models/models.dart';
import 'package:inforas/providers/inforas_provider.dart';
import 'package:intl/intl.dart';


class DocumentoService extends ChangeNotifier {
  late Documento reportDocumento;
  late Login login;
  late List<Documento> listaDocumentos = [];

  String apiToken = InforasProvider.apiKey;

  // Future<String> crearDocumento(Map<String, dynamic> data) async {
  //   String titulo = data['titulo'];
  //   //TODO cambiar datos
  //   String descripcion = data['descripcion'];

  //   DateTime now = DateTime.now();
  //   String fecha = DateFormat('yyyy-MM-ddTHH:mm:ss').format(now);
  //   String foto = data['foto'];
  //   String latitud= data['latitud'];
  //   String longitud = data['longitud'];

  //   print('titulo: $titulo, descripcion: $descripcion, fecha: $fecha, latitud: $latitud, longitud: $longitud');
  //   print('user: ${LoginService.usuario.id}');

  //   Map<String, dynamic> newData = {
  //     'titulo': titulo,
  //     'descripcion': descripcion,
  //     'fechahora': fecha,
  //     'foto': foto,
  //     'estadoDocumento': 'ABIERTA',
  //     'accesibilidad': false,
  //     'id_cliente': LoginService.usuario.id,
  //     'latitud': latitud,
  //     'longitud': longitud
  //   };


  //   final jsonData =
  //       await InforasProvider.postJsonData('/documentos', newData);


  //   reportDocumento = Documento.fromJsonMap(json.decode(jsonData));

  //   return jsonData;
  // }

  Future<List<Documento>> getDocumentos() async {
    try {
      final jsonData = await InforasProvider.getJsonData('/documentos');
      List<Documento> listaDocumentos = jsonData.map((json) => Documento.fromJson(json)).toList();
      listaDocumentos.forEach((documento) => print(documento));
      notifyListeners();
      return listaDocumentos;
    } catch (error) {
      print('Error en la solicitud de documentos: $error');
      throw error;
    }
  }

//TODO Utilizar esto
  // Future<List<Documento>> getDocumentosCliente() async {
  //   try {
  //     final jsonData = await InforasProvider.getJsonData('/clientes/${LoginService.usuario.id}/documentos');
  //     List<Documento> listaDocumentos = jsonData.map((json) => Documento.fromJson(json)).toList();
  //     listaDocumentos.forEach((documento) => print(documento));
  //     notifyListeners();
  //     return listaDocumentos;
  //   } catch (error) {
  //     print('Error en la solicitud de documentos: $error');
  //     throw error;
  //   }
  // }

  // Future<void> deleteDocumento(int documentoId) async {
  //   final response =
  //       await InforasProvider.deleteData('/documentos/$documentoId');

  //   print(response);

  //   listaDocumentos.removeWhere((documento) => documento.id == documentoId);
  //   notifyListeners();
  // }
}
