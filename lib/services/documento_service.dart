import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inforas/models/documento.dart';
import 'package:inforas/models/models.dart';
import 'package:inforas/providers/inforas_provider.dart';
import 'package:inforas/services/login_service.dart';
import 'package:intl/intl.dart';


class DocumentoService extends ChangeNotifier {
  late Documento reportDocumento;
  late Login login;
  late List<Documento> listaDocumentos = [];

  String apiToken = InforasProvider.apiKey;
  

  Future<String> crearDocumento(Map<String, dynamic> data) async {
    String titulo = data['titulo'];
    String descripcion = data['descripcion'];

    // DateTime now = DateTime.now();
    // String fecha = DateFormat('yyyy-MM-ddTHH:mm:ss').format(now);
    String enlace = data['enlace'];
    String tipoDocumentacion = data['tipoDocumentacion'];

    print('titulo: $titulo, descripcion: $descripcion, enlace: $enlace, latitud: $tipoDocumentacion');
    print('user: ${LoginService.usuario.id}');

    Map<String, dynamic> newData = {
      'titulo': titulo,
      'descripcion': descripcion,
      'tipoDocumentacion': tipoDocumentacion,
      'enlace': enlace,
      'id_usuario': LoginService.usuario.id,
    };


    final jsonData =
        await InforasProvider.postJsonData('/documentos', newData);


    reportDocumento = Documento.fromJson(json.decode(jsonData));

    return jsonData;
  }

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

  Future<List<Documento>> getDocumentosCliente() async {
    try {
      final jsonData = await InforasProvider.getJsonData('/clientes/${LoginService.usuario.id}/documentos');
      List<Documento> listaDocumentos = jsonData.map((json) => Documento.fromJson(json)).toList();
      listaDocumentos.forEach((documento) => print(documento));
      notifyListeners();
      return listaDocumentos;
    } catch (error) {
      print('Error en la solicitud de documentos: $error');
      throw error;
    }
  }

Future<void> actualizarDocumento(int documentoId, Map<String, dynamic> data) async {
  try {
    String url = '/documentos/$documentoId';

    final jsonData = await InforasProvider.putJsonData(url, data);

    if (jsonData == null) {
      print('Documento actualizado exitosamente.');
    } else {
      print('Respuesta de la API después de actualizar el documento: $jsonData');
    }
  } catch (error) {
    print('Error al actualizar el documento: $error');
    throw error;
  }
}


  Future<void> deleteDocumento(int documentoId) async {
    final response =
        await InforasProvider.deleteData('/documentos/$documentoId');

    print(response);

    listaDocumentos.removeWhere((documento) => documento.idDocumento == documentoId);
    notifyListeners();
  }
}
