//https://www.youtube.com/watch?v=LoDtxRkGDTw
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inforas/models/evento.dart';
import 'package:inforas/providers/events_provider.dart';
import 'package:inforas/utils/utils.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final lugarController = TextEditingController();
  final enlaceController = TextEditingController();
  final tipoController = TextEditingValue();
  late DateTime fechaHoraEvento;

  @override
  void initState() {
    super.initState();
    if (widget.evento == null) {
      fechaHoraEvento = DateTime.now().add(Duration(hours: 2));
    } else {
      final event = widget.evento!;
      titleController.text = event.titulo;
      lugarController.text = event.lugar;
      enlaceController.text = event.enlace;
      // tipoController = TextEditingValue(text: event.tipoEvento);
      fechaHoraEvento = event.fecha;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          actions: buildEditingActions(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle(),
                SizedBox(height: 12),
                buildDatePickers(),
                SizedBox(height: 12),
                buildLugar(),
                SizedBox(height: 12),
                buildEnlace(),
              ],
            ),
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
            onPressed: saveForm)
      ];

  //Controladores de texto
  Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 21),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Indique un Título para el evento',
          hintStyle: TextStyle(fontSize: 20),
        ),
        onFieldSubmitted: (_) {},
        validator: (value) =>
            value!.isEmpty ? 'Por favor, ingrese un título' : null,
        controller: titleController,
      );

  Widget buildLugar() => TextFormField(
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Indique el lugar del evento',
          hintStyle: TextStyle(fontSize: 15),
        ),
        onFieldSubmitted: (_) {},
        validator: (value) => value!.isEmpty ? value = "Sin lugar" : null,
        controller: lugarController,
      );

  Widget buildEnlace() => TextFormField(
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Indique el enlace del evento',
          hintStyle: TextStyle(fontSize: 15),
        ),
        onFieldSubmitted: (_) {},
        validator: (value) => value!.isEmpty ? value = "Sin enlace" : null,
        controller: enlaceController,
      );

      // Widget buildTipoEvento() => DropdownButtonFormField(
      //   style: TextStyle(fontSize: 15),
      //   decoration: InputDecoration(
      //     border: UnderlineInputBorder(),
      //     hintText: 'Indique el enlace del evento',
      //     hintStyle: TextStyle(fontSize: 15),
      //   ),
      //   onFieldSubmitted: (_) {},
      //   validator: (value) => value!.isEmpty ? value = "Sin enlace" : null,
      //   controller: tipoController,
      // );

  Widget buildDatePickers() => Column(
        children: [
          buildFrom(),
        ],
      );

  Widget buildFrom() => buildHeader(
      //Nota: si quisieramos hacer el formato de fecha ("de" a "hasta" ("from" & "to")
      //Este ejemplo de abajo sería el from y el to sería duplicarlo y añadirle otro campo dateTime)
      header: 'Elija una fecha',
      child: Row(children: [
        Expanded(
          flex: 2,
          child: buildDropdownField(
            text: Utils.toDate(fechaHoraEvento),
            onClicked: () => pickfromDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: buildDropdownField(
            text: Utils.toTime(fechaHoraEvento),
            onClicked: () => pickfromDateTime(pickDate: false),
          ),
        ),
      ]));

  Future pickfromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fechaHoraEvento, pickDate: pickDate);
    if (date == null) return;

    setState(() {
      fechaHoraEvento = date;
    });
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: fechaHoraEvento,
        firstDate: fechaHoraEvento ?? DateTime(2022, 12, 31),
        lastDate: DateTime(2101),
      );
      if (date == null) return null;

      final time = Duration(
        hours: fechaHoraEvento.hour,
        minutes: fechaHoraEvento.minute,
      );

      return date.add(time);
    } else {
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(fechaHoraEvento),
      );

      if (timeOfDay == null) return null;
      final date = DateTime(
        fechaHoraEvento.year,
        fechaHoraEvento.month,
        fechaHoraEvento.day,
      );
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.keyboard_arrow_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          child,
        ],
      );

//Publicación, aquí se guarda el objeto que contiene:
//Titulo, tipo de evento, descripción, enlace, fecha y lugar.

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final evento = Evento(
          titulo: titleController.text,
          tipoEvento: "tipoEvento",
          descripcion: 'descripcion',
          enlace: enlaceController.text,
          fecha: fechaHoraEvento,
          lugar: lugarController.text);
      //Pensando como hacerlo, ya que en el caso de eventos, tanto el enlace como el lugar pueden ser opcionales.
      final isEditing = widget.evento != null;
      
      final provider = Provider.of<EventsProvider>(context, listen: false);
      
      if (isEditing) {
      provider.editEvento(evento, widget.evento!);
      
      Navigator.of(context).pop();
      } else {
      provider.addEvento(evento);
      }
      Navigator.of(context).pop();
      
    }
  }
}
