import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        backgroundColor: Colors.purple,
      ),
      body: calendar(),
    );
  }



  Widget calendar() {
    return Column (
    children: [ 
      Text("Dia seleccionado " + today.toString().split(" ")[0]),
      Container(
      child: TableCalendar(
        // locale: "en_US",
        // rowHeight: 50,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        selectedDayPredicate: (day) => isSameDay(day, today),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: today,
        onDaySelected: _onDaySelected,
      ),
    )
    ]
    );
  }
}