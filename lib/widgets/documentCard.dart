// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//import 'package:inforas/services/services.dart';

class documentCard extends StatelessWidget {
  // const documentCard({super.key, required this.product});
  // final Product product;
  const documentCard(
      {required this.testName, this.desc, required this.additionalInfo});
  final String testName;
  final String? desc;
  final String additionalInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 210,
        margin: EdgeInsets.only(top: 30, bottom: 10),
        decoration: _cardBorders(),
        child: Stack(alignment: Alignment.bottomLeft, children: [
          // _BackgroundImage(product.picture),
          _docDetails(additionalInfo),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                top: 10, // Ajusta la posición vertical según sea necesario
                left: 20, // Ajusta la posición horizontal según sea necesario
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testName.length > 20
                              ? '${testName.substring(0, 20)}...'
                              : testName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (desc != null)
                      
                      Padding(
                        padding: const EdgeInsets.only(
                            top:
                                5.0),
                        child: SizedBox(
                width: MediaQuery.of(context).size.width - 70, // Ancho máximo
                        child: Text(
                          desc!.length > 130
                              ? '${desc!.substring(0, 130)}...'
                              : desc!,
                          style: TextStyle(fontSize: 14),
                        ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ]),
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

// class documentCard extends StatelessWidget {
//   const documentCard({
//     required this.testName,
//     required this.additionalInfo,
//     this.desc,
//   });

//   final String testName;
//   final String? desc;
//   final String additionalInfo;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         height: 200,
//         width: double.infinity,
//         margin: EdgeInsets.only(top: 30, bottom: 50),
//         decoration: _cardBorders(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 testName,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             if (desc != null)
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   desc!.length > 100 ? '${desc!.substring(0, 100)}...' : desc!,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               Positioned(
//                 child: _docDetails(additionalInfo),
//                 bottom: 0,
//               )

//           ],
//         ),
//       ),
//     );
//   }

//   BoxDecoration _cardBorders() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadiusDirectional.circular(25),
//       boxShadow: [
//         BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 10.0)
//       ],
//     );
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

// class _docDetails extends StatelessWidget {
//   const _docDetails(this.additionalInfo);
//   final String additionalInfo;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(right: 50),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

//         decoration: _buildBoxDecoration(),
//         height: 60,
//         width: double.infinity,
//         child: Column(
//           children: [
//             Text(
//               "Tipo de evento",
//               style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Text(
//               additionalInfo,
//               style: TextStyle(fontSize: 17, color: Colors.black),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   BoxDecoration _buildBoxDecoration() {
//     return BoxDecoration(
//       color: Color.fromARGB(255, 255, 251, 0),
//       borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
//     );
//   }
// }

class _docDetails extends StatelessWidget {
  const _docDetails(this.additionalInfo);
  final String additionalInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: _buildBoxDecoration(),
      height: 90,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tipo de evento",
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
              height: 5), // Espacio entre el título y la información adicional
          Text(
            additionalInfo,
            style: TextStyle(fontSize: 17, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    );
  }
}
