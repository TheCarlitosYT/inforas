import 'package:flutter/material.dart';
import 'package:inforas/models/documento.dart';
import 'package:inforas/providers/documentos_provider.dart';
import 'package:inforas/screens/document_edit_page.dart';
import 'package:provider/provider.dart';

class DocumentViewingPage extends StatelessWidget {
  final Documento documento;

  const DocumentViewingPage({Key? key, required this.documento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
        actions: buildViewingActions(context, documento),
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


  List<Widget> buildViewingActions(BuildContext context, Documento documento) {
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
          final provider = Provider.of<DocumentsProvider>(context, listen: false);
          provider.deleteDocumento(documento);
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
          'Enlace del documento',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          documento.enlace != null ? documento.enlace! : "No se ha establecido ningún enlace referente a este documento",
          style: TextStyle(
            fontSize: 16,
          ),
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
}
