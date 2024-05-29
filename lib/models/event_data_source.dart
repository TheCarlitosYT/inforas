import 'package:inforas/models/evento.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Evento> source) {
    this.appointments = source;
  }

  Evento getEvento(int index) => appointments![index] as Evento;

  //Overrides necesarios para la funcionalidad del calendario
  @override
  DateTime getStartTime(int index) {
    return getEvento(index).fecha;
  }

  @override 
  DateTime getEndTime(int index) {
    //Se podría implementar hora final y un booleano que pida si sabe o no hora de finalización
    // if (getEvento(index).tipoEvento == "Boolean") {
    //   //Esto
    // }

    //Misma fecha de momento ya que solo se pide hora de inicio
    return getEvento(index).fecha;
  }

  @override
  String getSubject(int index) {
    return getEvento(index).titulo;
  }

  @override
  Color getColor(int index) {
    return Colors.purple;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
