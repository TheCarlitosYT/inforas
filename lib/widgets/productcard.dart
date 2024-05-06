// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';  
// //import 'package:inforas/services/services.dart';

// class productCard extends StatelessWidget {
//   const productCard({super.key, required this.product});
//   final Product product;


//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         height: 400,
//         margin: EdgeInsets.only(top: 30, bottom: 50),
//         decoration: _cardBorders(),
//         child: Stack(
//           alignment: Alignment.bottomLeft,
//           children: [
//             _BackgroundImage(product.picture),
//             _productDetails(product.name, product.id),
//             Positioned(
//               top: 0,
//               right: 0,
//               child: _PriceTag(product.price),
//             ),
//             if (!product.available)
//             Positioned(
//               top: 0,
//               left: 0,
//               child: _NoDisponibleTag(),
//             ),

//             Positioned(
//               bottom: 10,
//               right: 10,
//               child: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () {
//                   // Mostrar un cuadro de diálogo de confirmación
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Eliminar Producto'),
//                         content: Text('¿Estás seguro de que quieres eliminar este producto?'),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
//                             },
//                             child: Text('Cancelar'),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               // Eliminar el producto
//                               Provider.of<ProductsService>(context, listen: false)
//                                   .deleteProduct(product);
//                               Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
//                             },
//                             child: Text('Eliminar'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   BoxDecoration _cardBorders() {
//     return BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadiusDirectional.circular(25),
//         boxShadow: [
//           BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 10.0)
//         ]);
//   }
// }

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
//         child: url == null 
//         ? Image(image: AssetImage('assets/no-image.png'),
//         fit: BoxFit.cover,
//         ) 
//        : FadeInImage(
//           placeholder: AssetImage('assets/jar-loading.gif'),
//           image: NetworkImage(/*'https://via.placeholder.com/400x300/f6f6f6'*/ url!),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

// class _productDetails extends StatelessWidget {
//   final String title;
//   final String? subtitle;
//   const _productDetails(this.title, this.subtitle);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 50),
//       child: Container(
//         decoration: _buildBoxDecoration(),
//         height: 70,
//         width: double.infinity,
//         child: Column(
//           children: [
//             Text(
//               /*'Disco Duro G'*/ title,
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Text(
//               /*'id del disco duro'*/ subtitle!,
//               style: TextStyle(fontSize: 15, color: Colors.white),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   BoxDecoration _buildBoxDecoration() {
//     return BoxDecoration(
//       color: Colors.indigo,
//       borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
//     );
//   }
// }

// class _PriceTag extends StatelessWidget {
//   final double price;
//   const _PriceTag(this.price);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.indigo,
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
//       ),
//       width: 100,
//       height: 70,
//       alignment: Alignment.center,
//       child: FittedBox(
//         fit: BoxFit.contain,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Text(
//             /*'103,99€'*/ "$price €",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _NoDisponibleTag extends StatelessWidget {
//   const _NoDisponibleTag({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.orange,
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
//       ),
//       width: 100,
//       height: 70,
//       alignment: Alignment.center,
//       child: FittedBox(
//         fit: BoxFit.contain,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Text(
//             'No disponible',
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }
