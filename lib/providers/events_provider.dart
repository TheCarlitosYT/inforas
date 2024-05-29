import 'package:flutter/material.dart';
import 'package:inforas/models/evento.dart';

class EventsProvider extends ChangeNotifier {
  final List<Evento> _eventos = [];

  List<Evento> get eventos => _eventos;

  void addEvento(Evento evento) {
    _eventos.add(evento);
    notifyListeners();
  }
}