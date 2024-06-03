// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:inforas/models/documento.dart';
import 'package:inforas/providers/inforas_provider.dart';
import 'package:inforas/screens/document_edit_page.dart';
import 'package:inforas/screens/document_viewing_page.dart';
import 'package:inforas/widgets/widgets.dart';
// import 'package:login_app/models/products.dart';
// import 'package:login_app/services/auth_service.dart';
// import 'package:provider/provider.dart';
// import 'package:login_app/services/services.dart';
// import 'package:login_app/screens/screens.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final productsService = Provider.of<ProductsService>(context);
    // final authService = Provider.of<AuthService>(context, listen: false);

    // final List<Documento> documentos = InforasProvider.getJsonData('/documentos/') as List<Documento>;

    // if (productsService.isLoading) return LoadingScreen();
    final documento = Documento(
          titulo: 'Titulo hiper mega largo',
          tipoDocumentacion: "Conferencia",
          descripcion: 'Descripcion',
          enlace: 'example.com'
          );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        title: Text('Documentos'),
        actions: [
          IconButton(
              onPressed: (() {
                // authService.logout();

                print('cerraste sesión');
                Navigator.pushReplacementNamed(context, '/login');
              }),
              icon: Icon(
                Icons.logout_outlined,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: /*productsService.products.length*/ 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: /*Text('Item: $index')*/ documentCard(
                /*product: productsService.products[index]*/ testName:
                    "Titulo hiper mega largo que supera los carácteres permitidos",
                desc:
                    "Descripcion super larga y con numero ultralargo con muchas palabras y letras con un numero ultrahipermega largo, tan largo que hasta un lorem no es comparable, no es rival, vaya numerin, 33? que va, mejor esta biblia, a ver que sacamos. Numero: ${index + 1}",
                additionalInfo: "Hola"),
            onTap: () {
              // productsService.selectedProduct = productsService.products[index].copy();
              // Navigator.pushNamed(context, 'product');
              print('Hola buenas noches');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DocumentViewingPage(documento: documento)),
              );
            },
          );
        },
      ),
      // bottomNavigationBar: CustomNavigationBottomBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // productsService.selectedProduct = new Product(
          //   available: false,
          //   name: '',
          //   price: 0
          //   );
          Navigator.pushNamed(context, '/form');
        },
      ),
    );
  }
}
