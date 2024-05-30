import 'package:flutter/material.dart';
import 'package:inforas/models/evento.dart';
import 'package:inforas/providers/events_provider.dart';
import 'package:inforas/screens/screens.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventViewingPage extends StatelessWidget {
  final Evento evento;

  const EventViewingPage({Key? key, required this.evento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildViewingActions(context, evento),
        title: const Text("Información del evento"),
      ),
      body: ListView(padding: EdgeInsets.all(32), children: <Widget>[
        Text(
          evento.titulo,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        buildDateTime(evento),
        SizedBox(height: 16),
        Text(
          evento.descripcion,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }

  Widget buildDateTime(Evento evento) {
    return Column(
      children: [buildDate('Hora', evento.fecha)],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          DateFormat.yMMMd().format(date),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Widget> buildViewingActions(BuildContext context, Evento evento) {
    return [
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventEditingPage(evento: evento),
          ),
        ),
      ),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          final provider = Provider.of<EventsProvider>(context, listen: false);
          provider.deleteEvento(evento);
        },
      ),
    ];
  }
}
