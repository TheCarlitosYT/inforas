import 'package:flutter/material.dart';
import 'package:inforas/widgets/inputDecorations.dart';


class EventFormScreen extends StatelessWidget  {
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
        body: EventosForm(),
        // bottomNavigationBar: CustomNavigationBottomBar(),
      ),
    );
  }
}

class EventosForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
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
            TextFormField(
  onTap: () async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null /*&& pickedDate != productForm.product.date*/ ) {
      // productForm.product.date = pickedDate;
      // productForm.notifyListeners();
    }
  },
  readOnly: true,
  controller: TextEditingController(
       text: today.toString().split(" ")[0]) /*productForm.product.date?.toString().split(' ')[0] ?? '')*/,
  keyboardType: TextInputType.datetime,
  decoration: InputDecorations.authInputDecoration(
    hintText: 'Fecha del producto',
    labelText: 'Fecha:',
  ),
  // validator: (value) => productForm.validateDate(value),
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
