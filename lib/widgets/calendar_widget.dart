import 'package:flutter/material.dart';
import 'package:inforas/models/event_data_source.dart';
import 'package:inforas/providers/events_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventos = Provider.of<EventsProvider>(context).eventos;

    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      dataSource: EventDataSource(eventos),
      firstDayOfWeek: 1,
      monthViewSettings: MonthViewSettings(
        showAgenda: true, 
        agendaViewHeight: 115,
        numberOfWeeksInView: 6,),
      
    );
  }
}