//https://www.youtube.com/watch?v=LoDtxRkGDTw
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:inforas/models/evento.dart';

class EventEditingPage extends StatefulWidget {
  final Evento? evento;

  const EventEditingPage({
    Key? key,
    this.evento,
  }) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  late DateTime fechaHoraEvento;

  @override
  void initState() {
    super.initState();
    if (widget.evento == null) {
      fechaHoraEvento = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildEditingActions(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildTitle()
            ],
          ),
        ),
      );

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            icon: Icon(Icons.save),
            label: Text('Guardar'),
            onPressed: () => Navigator.pop(context))
      ];

      Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Título',
        ),
        onFieldSubmitted: (_) {},
        
      );
}
