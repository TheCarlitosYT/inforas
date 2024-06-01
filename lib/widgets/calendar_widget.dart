import 'package:flutter/material.dart';
import 'package:inforas/models/event_data_source.dart';
import 'package:inforas/models/evento.dart';
import 'package:inforas/providers/events_provider.dart';
import 'package:inforas/screens/event_viewing_page.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//https://support.syncfusion.com/kb/article/10775/how-to-show-the-tapped-appointment-details-on-another-page-in-the-flutter-calendar
class calendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventos = Provider.of<EventsProvider>(context).eventos;

    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      //DataSource es para implementarlo al calendar, hay que ver como hacerlo desde la DDBB
      dataSource: EventDataSource(eventos),
      firstDayOfWeek: 1,
      monthViewSettings: MonthViewSettings(
        showAgenda: true,
        agendaViewHeight: 115,
        numberOfWeeksInView: 6,
        showTrailingAndLeadingDates: false,
        dayFormat: 'EEE',
      ),
    onTap: (calendarTapDetails) => calendarTapped(context, calendarTapDetails),
    );
  }

  void calendarTapped(BuildContext context, CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.appointment) {
      Evento evento = calendarTapDetails.appointments![0];
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventViewingPage(evento: evento)),
      );
    } else {
      print('Hola');
    }
  }
}


