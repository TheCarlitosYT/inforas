// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforas/models/documento.dart';
import 'package:inforas/navigation_menu.dart';
import 'package:inforas/providers/documentos_provider.dart';
import 'package:inforas/services/documento_service.dart';
import 'package:inforas/services/login_service.dart';
import 'package:inforas/widgets/errorPopUp.dart';
import 'package:inforas/widgets/succesPopUp.dart';
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
  DocumentoService documentoService = new DocumentoService();

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
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
      print(documento.idDocumento);
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
        child: Text('CFC general'),
        value: 'CFC_General',
      ),
      DropdownMenuItem(
        child: Text('Noonan general'),
        value: 'Noonan_General',
      ),
      DropdownMenuItem(
        child: Text('Neuropsicologia y NEE'),
        value: 'Neuropsicologia_y_NEE',
      ),
      DropdownMenuItem(
        child: Text('Talla Baja / Hormona Crecimiento'),
        value: 'Talla_Baja_y_Hormona_Crec',
      ),
      DropdownMenuItem(
        child: Text('Asociaciones / Instituciones'),
        value: 'Asociaciones_Instituciones',
      ),
      DropdownMenuItem(
        child: Text('Otros'),
        value: 'Otros',
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
      // final documento = Documento(
      //     titulo: titleController.text,
      //     tipoDocumentacion: tipoController.text,
      //     descripcion: descripcionController.text.isNotEmpty
      //         ? descripcionController.text
      //         : null,
      //     enlace: enlaceController.text,
      //     idUsuario: 1,
      //     );

          Map<String, dynamic> data = {
              'titulo': '${titleController.text}',
              'tipoDocumentacion': '${tipoController.text}',
              'descripcion': '${descripcionController.text.isNotEmpty
              ? descripcionController.text
              : null}',
              'enlace': '${enlaceController.text}',
              'id_usuario': LoginService.usuario.id,
            };
      final isEditing = widget.documento != null;

      if (isEditing) {
        // provider.editDocumento(documento, widget.documento!);
        final documento = widget.documento!;

        documentoService.actualizarDocumento(documento.idDocumento!, data).then((value) {
              SuccessPopup(title: 'Cambios realizados correctamente')
              .showSuccessPopup(context);
              }).catchError((error) {
              ErrorPopup(
                title: 'Error al actualizar el documento',
                message: 'Intentelo de nuevo más tarde.',
              ).showErrorPopup(context);
            });
      } else {
        documentoService.crearDocumento(data).then((value) {
                SuccessPopup(title: 'Documento creado correctamente')
                .showSuccessPopup(context);
              }).catchError((error) {
                ErrorPopup(
                    title: 'Error al crear el documento',
                    message: 'Intentelo de nuevo más tarde.');
                print('Error durante la creación de Incidencia $error');
              });
        // provider.addDocumento(documento);
      }
      Get.to(() => const NavigationMenu(index: 0,));
      setState(() {});
    }
  }
}
