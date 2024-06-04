import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforas/models/evento.dart';
import 'package:inforas/models/models.dart';
import 'package:inforas/navigation_menu.dart';
import 'package:inforas/providers/inforas_provider.dart';
import 'package:inforas/services/login_service.dart';


class EventoService extends ChangeNotifier {
  late Evento reportEvento;
  late Login login;
  late List<Evento> listaEventos = [];

  String apiToken = InforasProvider.apiKey;
  

  Future<String> crearEvento(Map<String, dynamic> data) async {
    String titulo = data['titulo'];
    String descripcion = data['descripcion'];
    String formatoEvento = data['formatoEvento'];
    DateTime fecha = data['fecha'];
    String lugar = data['lugar'];

    // DateTime now = DateTime.now();
    // String fecha = DateFormat('yyyy-MM-ddTHH:mm:ss').format(now);
    String enlace = data['enlace'];
    String tipoEvento = data['tipoEvento'];

    print('user: ${LoginService.usuario.id}');

    Map<String, dynamic> newData = {
      'titulo': titulo,
      'descripcion': descripcion,
      'tipoEvento': tipoEvento,
      'formatoEvento': formatoEvento,
      'fecha': fecha.toIso8601String(),
      'lugar': lugar,
      'enlace': enlace,
      'id_usuario': LoginService.usuario.id,
    };


    final jsonData =
        await InforasProvider.postJsonData('/eventos', newData);


    reportEvento = Evento.fromJson(json.decode(jsonData));

    return jsonData;
  }

  Future<List<Evento>> getEventos() async {
    try {
      final jsonData = await InforasProvider.getJsonData('/eventos');
      List<Evento> listaEventos = jsonData.map((json) => Evento.fromJson(json)).toList();
      listaEventos.forEach((evento) => print(evento));
      notifyListeners();
      return listaEventos;
    } catch (error) {
      print('Error en la solicitud de eventos: $error');
      throw error;
    }
  }

  Future<List<Evento>> getEventosCliente() async {
    try {
      final jsonData = await InforasProvider.getJsonData('/clientes/${LoginService.usuario.id}/eventos');
      List<Evento> listaEventos = jsonData.map((json) => Evento.fromJson(json)).toList();
      listaEventos.forEach((evento) => print(evento));
      notifyListeners();
      return listaEventos;
    } catch (error) {
      print('Error en la solicitud de eventos: $error');
      throw error;
    }
  }

Future<void> actualizarEvento(int eventoId, Map<String, dynamic> data) async {
  try {
    String url = '/eventos/$eventoId';

    final jsonData = await InforasProvider.putJsonData(url, data);

    if (jsonData == null) {
      print('Evento actualizado exitosamente.');
    } else {
      print('Respuesta de la API después de actualizar el evento: $jsonData');
    }
  } catch (error) {
    print('Error al actualizar el evento: $error');
    throw error;
  }
}


  Future<void> deleteEvento(int eventoId) async {
    final response =
        await InforasProvider.deleteData('/eventos/$eventoId');
    print(response);
    listaEventos.removeWhere((evento) => evento.idEventos == eventoId);
    Get.to (() => const NavigationMenu());
    notifyListeners();
  }
}
