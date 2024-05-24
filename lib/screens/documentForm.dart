import 'package:flutter/material.dart';


class DocumentFormScreen extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulario'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: DocumentosForm(),
        // bottomNavigationBar: CustomNavigationBottomBar(),
      ),
    );
  }
}

class DocumentosForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Descripción'),
              
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                print("Hola");
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
