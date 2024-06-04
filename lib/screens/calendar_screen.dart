import 'package:flutter/material.dart';
import 'package:inforas/widgets/calendar_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        title: Text('Calendario de eventos'),
        actions: [
        IconButton(
          onPressed: (() {
            print('cerraste sesión');
            Navigator.pushReplacementNamed(context, '/login');
          }), 
          icon: Icon(Icons.logout_outlined, color: Color.fromARGB(255, 255, 255, 255),)
        )
        ],
      ),
      body: calendarWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/eventoform');
        },
      ),
    );
  }
}