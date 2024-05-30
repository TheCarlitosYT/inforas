import 'package:flutter/material.dart';
import 'package:inforas/models/evento.dart';
import 'package:inforas/providers/events_provider.dart';
import 'package:inforas/screens/screens.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart'; // for other locales

class EventViewingPage extends StatelessWidget {
  final Evento evento;

  const EventViewingPage({Key? key, required this.evento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
        actions: buildViewingActions(context, evento),
        title: const Text("Información del evento"),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView(padding: EdgeInsets.all(32), children: <Widget>[
        Text(
          evento.titulo,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildDateTime(evento),
        SizedBox(height: 26),
        detailsScreen(evento)
      ]),
    );
  }

  Widget buildDateTime(Evento evento) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildDate('Comienzo del evento', evento.fecha)],
    );
  }

  Widget buildDate(String title, DateTime date) {
    var dateFormat = DateFormat.yMMMMd('es').format(date);

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
          // ignore: prefer_interpolation_to_compose_strings
          'Día ' + dateFormat + ' a las ' + DateFormat('HH:mm').format(date),
          style: TextStyle(
            fontSize: 16,
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

  Widget detailsScreen(Evento evento) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lugar del evento',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          evento.lugar,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'Enlace del evento',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          evento.enlace,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'Descripción del evento',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          evento.descripcion != null ? evento.descripcion! : "Sin descripción",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
