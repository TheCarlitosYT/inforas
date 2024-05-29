import 'package:flutter/material.dart';
import 'package:inforas/models/event_data_source.dart';
import 'package:inforas/providers/events_provider.dart';
import 'package:intl/intl.dart';
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
      dataSource: EventDataSource(eventos),
      firstDayOfWeek: 1,
      monthViewSettings: MonthViewSettings(
        showAgenda: true,
        agendaViewHeight: 115,
        numberOfWeeksInView: 6,
        showTrailingAndLeadingDates: false,
        dayFormat: 'EEE',
      ),
      onTap: calendarTapped,
    );
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.appointment) {
      Appointment appointment = calendarTapDetails.appointments![0];
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondRoute(appointment: appointment)),
      );
    }
  }
}

class SecondRoute extends StatelessWidget {
  Appointment? appointment;

  SecondRoute({super.key, this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Column(
        children: [
          const Divider(
            color: Colors.white,
          ),
          Center(
            child: Text(
              appointment!.subject,
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Center(
            child: Text(DateFormat('MMMM yyyy,hh:mm a')
                .format(
                  appointment!.startTime,
                )
                .toString()),
          ),
          const Divider(
            color: Colors.white,
          ),
          Center(
            child: Text(DateFormat('MMMM yyyy,hh:mm a')
                .format(
                  appointment!.endTime,
                )
                .toString()),
          ),
        ],
      ),
    );
  }
}
