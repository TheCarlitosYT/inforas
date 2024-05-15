// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';  
//import 'package:inforas/services/services.dart';

class documentCard extends StatelessWidget {
  // const documentCard({super.key, required this.product});
  // final Product product;
  const documentCard({required this.testName, required this.desc});
  final String testName;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.only(top: 30, bottom: 50),
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // _BackgroundImage(product.picture),
            _docDetails(testName, desc),

            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Mostrar un cuadro de diálogo de confirmación
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Eliminar Producto'),
                        content: Text('¿Estás seguro de que quieres eliminar este producto?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
                            },
                            child: Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Eliminar el producto
                              // Provider.of<ProductsService>(context, listen: false)
                              //     .deleteProduct(product);
                              Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
                            },
                            child: Text('Eliminar'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 10.0)
        ]);
  }
}

// class _BackgroundImage extends StatelessWidget {
//   final String? url;
//   const _BackgroundImage(this.url);
  
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 400,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(25),
//         child: Text("test")/* url == null 
//         ? Image(image: AssetImage('assets/no-image.png'),Text(('text'),
//         //fit: BoxFit.cover,
//         ) 
//        : FadeInImage(
//           placeholder: AssetImage('assets/jar-loading.gif'),
//           image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6' /*url!*/),
//           fit: BoxFit.cover,
//         ),*/
//       ),
//     );
//   }
// }

class _docDetails extends StatelessWidget {
  final String title;
  final String? subtitle;
  const _docDetails(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        decoration: _buildBoxDecoration(),
        height: 60,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle!,
              style: TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
    );
  }
}

