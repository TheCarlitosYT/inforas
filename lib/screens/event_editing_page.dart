//https://www.youtube.com/watch?v=LoDtxRkGDTw
// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

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
  var tipoController = TextEditingController();
  final descripcionController = TextEditingController();

  late DateTime fechaHoraEvento;

  @override
  void initState() {
    super.initState();
    if (widget.evento == null) {
      fechaHoraEvento = DateTime.now().add(Duration(hours: 2));
      tipoController.text = '';
    } else {
      final event = widget.evento!;
      titleController.text = event.titulo;
      lugarController.text = event.lugar;
      enlaceController.text = event.enlace ?? "";
      tipoController.text = event.tipoEvento;
      fechaHoraEvento = event.fecha;
      descripcionController.text = event.descripcion ?? '';
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
          iconTheme: IconThemeData(
            color: const Color.fromARGB(
                255, 255, 255, 255), //change your color here
          ),
          actions: buildEditingActions(),
          backgroundColor: Colors.purple,
          title: Text(
            widget.evento == null ? 'Crear un nuevo evento' : 'Editar evento',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
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
                SizedBox(height: 12),
                buildTipoEvento(),
                SizedBox(height: 12),
                buildDescription(),
                SizedBox(height: 12),
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
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            label: Text(
              'Guardar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: saveForm)
      ];

  //Controladores de texto
  Widget buildTitle() => buildHeader(
      header: 'Título',
      child: TextFormField(
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Indique un Título para el evento',
          hintStyle: TextStyle(fontSize: 18),
        ),
        onFieldSubmitted: (_) {},
        validator: (value) =>
            value!.isEmpty ? 'Por favor, ingrese un título' : null,
        controller: titleController,
      ));


  Widget buildLugar() => buildHeader(
      header: 'Lugar donde se realiza el evento',
      child: TextFormField(
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Indique el lugar del evento.',
          hintStyle: TextStyle(fontSize: 15),
        ),
        onFieldSubmitted: (_) {},
        validator: (value) => value!.isEmpty ? value = "Sin lugar" : null,
        controller: lugarController,
  ));

  Widget buildEnlace() => buildHeader(
      header: 'Enlace del evento',
      child: TextFormField(
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Indique el enlace del evento. (opcional)',
          hintStyle: TextStyle(fontSize: 15),
        ),
        onFieldSubmitted: (_) {},
        controller: enlaceController,
  ));

  Widget buildDescription() => buildHeader(
      header: 'Descripción del evento',
      child: Container(
        margin: EdgeInsets.only(top: 15),
        height: 150,
        width: double.infinity,
        child: TextField(
          textAlign: TextAlign.start,
          textAlignVertical:
              TextAlignVertical.top, // Alinea el texto desde la parte superior
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Indique la descripción del evento. (opcional)',
            hintStyle: TextStyle(fontSize: 15),
          ),
          expands: true,
          maxLength: 240,
          maxLines: null, // Permite múltiples líneas
          keyboardType: TextInputType.multiline,
          controller: descripcionController,
          onSubmitted: (_) {},
        ),
  ));
  Widget buildTipoEvento() => buildHeader(
  header: 'Tipo de evento',
  child: DropdownButtonFormField(
    style: TextStyle(fontSize: 15, color: Colors.black),
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      hintText: 'Indique el tipo de evento',
      hintStyle: TextStyle(fontSize: 15),
    ),
    items: [
      // Placeholder
      DropdownMenuItem(
        child: Text('Conferencia'),
        value: 'Conferencia',
      ),
      DropdownMenuItem(
        child: Text('Taller'),
        value: 'Taller',
      ),
    ],
    onChanged: (value) {
      setState(() {
        if (value != null){
        tipoController.text = value;
        } else {
          tipoController.text = '' ;
        }
      });
    },
    value: tipoController.text.isNotEmpty ? tipoController.text : null,
    onSaved: (_) {},
    validator: (value) => value!.isEmpty ? value = "Sin categoría" : null,
  ));

  Widget buildDatePickers() => Column(
        children: [
          buildFrom(),
        ],
      );

  Widget buildFrom() => buildHeader(
      //Nota: si quisieramos hacer el formato de fecha ("de" a "hasta" ("from" & "to")
      //Este ejemplo de abajo sería el from y el to sería duplicarlo y añadirle otro campo dateTime)
      header: 'Fecha de comienzo',
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
          SizedBox(height: 5),
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
          tipoEvento: tipoController.text,
          descripcion: descripcionController.text.isNotEmpty
              ? descripcionController.text
              : null,
          enlace: enlaceController.text.isNotEmpty ? enlaceController.text : null,
          fecha: fechaHoraEvento,
          lugar: lugarController.text,
          idUsuario: 1,
          );
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
