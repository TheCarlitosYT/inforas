// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:inforas/models/documento.dart';
import 'package:inforas/screens/document_viewing_page.dart';
import 'package:inforas/services/documento_service.dart';
import 'package:inforas/services/login_service.dart';
import 'package:inforas/widgets/widgets.dart';
import 'package:provider/provider.dart';
// import 'package:login_app/models/products.dart';
// import 'package:login_app/services/auth_service.dart';
// import 'package:provider/provider.dart';
// import 'package:login_app/services/services.dart';
// import 'package:login_app/screens/screens.dart';


class homeScreen extends StatefulWidget {
  @override
  homeScreenState createState() => homeScreenState();
}

class homeScreenState extends State<homeScreen> {
  // const homeScreen({Key? key}) : super(key: key);

Future<List<Documento>> getDocumentsList() async {
    List<Documento> documentosF = await DocumentoService().getDocumentos();
    return documentosF;
  }


  @override
  Widget build(BuildContext context) {
    // final productsService = Provider.of<ProductsService>(context);
    // final authService = Provider.of<AuthService>(context, listen: false);

    final checkTokenService = Provider.of<LoginService>(context, listen: false);
    

    print('test');
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
                checkTokenService.logout();

                print('cerraste sesión');
                Navigator.pushReplacementNamed(context, '/login');
              }),
              icon: Icon(
                Icons.logout_outlined,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
      ),
      // body: ListView.builder(
      //   itemCount: /*productsService.products.length*/ 10,
      //   itemBuilder: (context, index) {
      //     return GestureDetector(
      //       child: /*Text('Item: $index')*/ documentCard(/*product: productsService.products[index]*/ testName: "Titulo hiper mega largo que supera los carácteres permitidos", desc: "Descripcion super larga y con numero ultralargo con muchas palabras y letras con un numero ultrahipermega largo, tan largo que hasta un lorem no es comparable, no es rival, vaya numerin, 33? que va, mejor esta biblia, a ver que sacamos. Numero: ${index + 1}", additionalInfo: "Hola"),
      //       onTap: () {
      //         // productsService.selectedProduct = productsService.products[index].copy();
      //         // Navigator.pushNamed(context, 'product');
      //         // print('Hola buenas noches');
      //         // Navigator.pushNamed(context, '/form');
      //       },
      //     );
      //   },
      // ),

      body: FutureBuilder<List<Documento>>(
        future: getDocumentsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final documentos = snapshot.data!;
            if (documentos.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No hay documentos disponibles.'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/form');
                      },
                      child: Text('Crear documento'),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: documentos.length,
                itemBuilder: (context, index) {
                  final documento = documentos[index];
                  return GestureDetector(
                    child: documentCard(
                        testName: documento.titulo,
                        desc: documento.descripcion,
                        additionalInfo: documento.tipoDocumentacion),
                    onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DocumentViewingPage(documento: documento)),
              );                    },
                  );
                },
              );
            }
          }
        },
      ),
// body: FutureBuilder<List<Documento>>(
//   future: documentos, // Utiliza tu método para obtener la lista de documentos
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (snapshot.hasError) {
//       // Maneja el caso de error
//       return Center(
//         child: Text('Error: ${snapshot.error}'),
//       );
//     } else {
//       // Cuando los datos están disponibles
//       if (snapshot.data == null || snapshot.data!.isEmpty || snapshot.data == []) {
//         // Si la lista de documentos es nula o está vacía, muestra un mensaje indicando que no hay documentos
//         return Center(
//           child: Text('No hay documentos disponibles'),
//         );
//       } else {
//         // Muestra el ListView.builder con la lista de documentos
//         List<Documento> documentos = snapshot.data!;
//         return ListView.builder(
//           itemCount: documentos.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               child: documentCard(testName: documentos[index].titulo, desc: "Descripcion super larga y con numero ultralargo con muchas palabras y letras con un numero ultrahipermega largo, tan largo que hasta un lorem no es comparable, no es rival, vaya numerin, 33? que va, mejor esta biblia, a ver que sacamos. Numero: ${index + 1}", additionalInfo: "Hola"),
//               onTap: () {
//                 // Aquí podrías implementar la lógica para cuando se toca un documento en la lista
//               },
//             );
//           },
//         );
//       }
//     }
//   },
// ),

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
