//pdte 
//import 'package:flutter/material.dart';
// import 'package:inforas/screens/form.dart';
// import 'package:inforas/screens/home.dart';

// class CustomNavigationBottomBar extends StatelessWidget {
//   const CustomNavigationBottomBar({Key? key}) : super(key: key);
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     final screens = [homeScreen(), formScreen()];

//     return Scaffold(
//       body: IndexedStack(
//         index: selectedIndex,
//         children: screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: (newIndex) {
//           setState(() {
//             selectedIndex = newIndex;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.edit_document),
//             label: 'Documentos',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Calendario',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Perfil',
//           ),
//         ],
//       ),
//     );
//   }
// }
