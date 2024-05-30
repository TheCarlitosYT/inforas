// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:inforas/models/documento.dart';
import 'package:inforas/providers/documentos_provider.dart';
import 'package:provider/provider.dart';

class DocumentEditingPage extends StatefulWidget {
  final Documento? documento;

  const DocumentEditingPage({
    Key? key,
    this.documento,
  }) : super(key: key);

  @override
  _DocumentEditingPageState createState() => _DocumentEditingPageState();
}

class _DocumentEditingPageState extends State<DocumentEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final lugarController = TextEditingController();
  final enlaceController = TextEditingController();
  var tipoController = TextEditingController();
  final descripcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.documento == null) {
      tipoController.text = '';
    } else {
      final documento = widget.documento!;
      titleController.text = documento.titulo;
      enlaceController.text = documento.enlace;
      tipoController.text = documento.tipoDocumentacion;
      descripcionController.text = documento.descripcion ?? '';
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
            widget.documento == null ? 'Crear un nuevo documento' : 'Editar documento',
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
                buildEnlace(),
                SizedBox(height: 12),
                buildTipoDocumento(),
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
          hintText: 'Indique un Título para el documento',
          hintStyle: TextStyle(fontSize: 18),
        ),
        onFieldSubmitted: (_) {},
        validator: (value) =>
            value!.isEmpty ? 'Por favor, ingrese un título' : null,
        controller: titleController,
      ));

  Widget buildEnlace() => buildHeader(
      header: 'Enlace del documento',
      child: TextFormField(
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Indique el enlace del documento. (obligatorio)',
          hintStyle: TextStyle(fontSize: 15),
        ),
        onFieldSubmitted: (_) {},
        validator: (value) =>
            value!.isEmpty ? 'Por favor, ingrese un enlace.' : null,
        controller: enlaceController,
  ));

  Widget buildDescription() => buildHeader(
      header: 'Descripción del documento',
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
            hintText: 'Indique la descripción del documento. (opcional)',
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
  Widget buildTipoDocumento() => buildHeader(
  header: 'Tipo de documento',
  child: DropdownButtonFormField(
    style: TextStyle(fontSize: 15, color: Colors.black),
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      hintText: 'Indique el tipo de documento',
      hintStyle: TextStyle(fontSize: 15),
    ),
    items: [
      // TODO: CHANGE Placeholder
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
//Titulo, tipo de documento, descripción, enlace, fecha y lugar.

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final documento = Documento(
          titulo: titleController.text,
          tipoDocumentacion: tipoController.text,
          descripcion: descripcionController.text.isNotEmpty
              ? descripcionController.text
              : null,
          enlace: enlaceController.text
          );
      final isEditing = widget.documento != null;

      //TODO: Documentos Provider
      final provider = Provider.of<DocumentsProvider>(context, listen: false);

      if (isEditing) {
        provider.editDocumento(documento, widget.documento!);

        Navigator.of(context).pop();
      } else {
        provider.addDocumento(documento);
      }
      Navigator.of(context).pop();
    }
  }
}
