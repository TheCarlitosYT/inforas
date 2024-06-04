// //https://support.syncfusion.com/kb/article/10775/how-to-show-the-tapped-appointment-details-on-another-page-in-the-flutter-calendar
// import 'package:flutter/material.dart';
// import 'package:inforas/models/event_data_source.dart';
// import 'package:inforas/models/evento.dart';
// import 'package:inforas/providers/events_provider.dart';
// import 'package:inforas/screens/event_viewing_page.dart';
// import 'package:inforas/services/evento_service.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';


// class calendarWidget extends StatefulWidget {
//   @override
//   _calendarWidgetState createState() => _calendarWidgetState();
// }

// class _calendarWidgetState extends State<calendarWidget> {

//   Future<List<Evento>> getDocumentsList() async {
//     List<Evento> eventosD = await EventoService().getEventos();
//     return eventosD;
//   }
//   @override
//   Widget build(BuildContext context) {
//     final eventos = Provider.of<EventsProvider>(context).eventos;

//     return SfCalendar(
//       view: CalendarView.month,
//       initialSelectedDate: DateTime.now(),
//       cellBorderColor: Colors.transparent,
//       //DataSource es para implementarlo al calendar, hay que ver como hacerlo desde la DDBB
//       dataSource: EventDataSource(eventos),
//       firstDayOfWeek: 1,
//       monthViewSettings: MonthViewSettings(
//         showAgenda: true,
//         agendaViewHeight: 115,
//         numberOfWeeksInView: 6,
//         showTrailingAndLeadingDates: false,
//         dayFormat: 'EEE',
//       ),
//     onTap: (calendarTapDetails) => calendarTapped(context, calendarTapDetails),
//     );
//   }

//   void calendarTapped(BuildContext context, CalendarTapDetails calendarTapDetails) {
//     if (calendarTapDetails.targetElement == CalendarElement.appointment) {
//       Evento evento = calendarTapDetails.appointments![0];
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => EventViewingPage(evento: evento)),
//       );
//     } else {
//       print('Hola');
//     }
//   }
// }





import 'package:flutter/material.dart';
import 'package:inforas/models/event_data_source.dart';
import 'package:inforas/screens/event_viewing_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:inforas/models/evento.dart';
import 'package:inforas/services/evento_service.dart';

class calendarWidget extends StatefulWidget {
  @override
  _calendarWidgetState createState() => _calendarWidgetState();
}

class _calendarWidgetState extends State<calendarWidget> {
  late Future<List<Evento>> _eventosFuture;

  @override
  void initState() {
    super.initState();
    _eventosFuture = EventoService().getEventos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Evento>>(
      future: _eventosFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Muestra un indicador de carga mientras se obtienen los eventos.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Cuando los eventos se han obtenido correctamente, se muestra el calendario con el DataSource adecuado.
          return SfCalendar(
            view: CalendarView.month,
            initialSelectedDate: DateTime.now(),
            cellBorderColor: Colors.transparent,
            dataSource: EventDataSource(snapshot.data!), // Utiliza los eventos obtenidos.
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
      },
    );
  }

  void calendarTapped(BuildContext context, CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.appointment) {
      Evento evento = calendarTapDetails.appointments![0] as Evento;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventViewingPage(evento: evento)),
      );
    } else {
      print('Hola');
    }
  }
}
