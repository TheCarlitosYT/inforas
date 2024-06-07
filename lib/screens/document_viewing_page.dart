import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforas/models/documento.dart';
import 'package:inforas/navigation_menu.dart';
import 'package:inforas/screens/document_edit_page.dart';
import 'package:inforas/services/documento_service.dart';
import 'package:inforas/widgets/addDocuments.dart';

class DocumentViewingPage extends StatelessWidget {
  final Documento documento;

  const DocumentViewingPage({Key? key, required this.documento}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     NavigationMenuController navigationMenuController = Get.put(NavigationMenuController());
    DocumentoService documentoService = new DocumentoService();
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
        actions: buildViewingActions(context, documento, documentoService, navigationMenuController),
        title: const Text("Vista del documento"),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView(padding: EdgeInsets.all(32), children: <Widget>[
        Text(
          documento.titulo,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 26),
        detailsScreen(documento)
      ]),
    );
  }


  List<Widget> buildViewingActions(BuildContext context, Documento documento, DocumentoService documentoService, NavigationMenuController navigationMenuController) {
    return [
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DocumentEditingPage(documento: documento),
          ),
        ),
      ),
      IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Eliminar Documento'),
                      content: Text(
                          '¿Estás seguro de que quieres eliminar este documento?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            _eliminarDocumento(documento, documentoService);
                            navigationMenuController.updateSelectedIndex(0);
                            Get.to(() => NavigationMenu());
                          },
                          child: Text('Eliminar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
    ];
  }

  Widget detailsScreen(Documento documento) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        Text(
          'Haga click en el botón para abrir el documento',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Text(
        //   documento.enlace != null ? documento.enlace! : "No se ha establecido ningún enlace referente a este documento",
        //   style: TextStyle(
        //     fontSize: 16,
        //   ),
        // ),
        FloatingActionButton(
          child: Text('Abrir'),
          onPressed: () => openFileString(documento.enlace),
        
        ),
        SizedBox(height: 14),
        Text(
          'Tipo de documento',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          documento.tipoDocumentacion,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'Descripción del documento',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          documento.descripcion != null ? documento.descripcion! : "Sin descripción",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  void _eliminarDocumento(Documento documento, DocumentoService documentoService) {
    documentoService.deleteDocumento(documento.idDocumento!);
    print('Eliminar favorito ${documento.idDocumento}');
  }
}