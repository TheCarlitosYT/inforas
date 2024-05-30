import 'package:flutter/material.dart';
import 'package:inforas/models/evento.dart';

class EventsProvider extends ChangeNotifier {
  final List<Evento> _eventos = [];

  List<Evento> get eventos => _eventos;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<Evento> get eventsOfSelectedDate => _eventos;
  
  void addEvento(Evento evento) {
    _eventos.add(evento);
    notifyListeners();
  }
  void deleteEvento(Evento evento) {
    _eventos.remove(evento);
    notifyListeners();
  }

  void editEvento(Evento evento, Evento eventoOld) {
    final index = _eventos.indexOf(eventoOld);
    _eventos[index] = evento;
    notifyListeners();
  }
}