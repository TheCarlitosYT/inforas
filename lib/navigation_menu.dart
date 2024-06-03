// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:inforas/screens/screens.dart';
// import 'package:inforas/screens/userScreen.dart';


// class NavigationMenu extends StatelessWidget {
//   final int? index;
//   const NavigationMenu({super.key, this.index});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());


//     return Scaffold(
//         bottomNavigationBar: Obx(
//         () => NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) => controller.selectedIndex.value = index,
//           backgroundColor:Colors.white,
//           destinations: [
//             NavigationDestination(icon: Icon(Icons.edit_document), label: 'Documentos'),
//             NavigationDestination(icon: Icon(Icons.calendar_today), label: 'Eventos'),
//             NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
//           ],
//         ),
//         ),
//         body: Obx(() => controller.screens[controller.selectedIndex.value]),
//       );   
//   }
// }

//   class NavigationController extends GetxController{
//     final Rx<int> selectedIndex = 0.obs;
    
//     final screens = [
//       homeScreen(),
//       const CalendarScreen(),
//       const UserScreen()
//     ];

//   //   List<StatelessWidget> get screens => [
//   //   const homeScreen(),
//   //   calendarWidget(),
//   //   const UserScreen(),
//   // ];
//   }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforas/screens/screens.dart';
import 'package:inforas/screens/userScreen.dart';

class NavigationMenu extends StatelessWidget {
  final int? index;
  const NavigationMenu({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(index: index));

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          destinations: [
            NavigationDestination(icon: Icon(Icons.edit_document), label: 'Documentos'),
            NavigationDestination(icon: Icon(Icons.calendar_today), label: 'Eventos'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex;
  final List<Widget> screens;

  NavigationController({int? index})
      : selectedIndex = (index ?? 0).obs,
        screens = [
          homeScreen(),
          const CalendarScreen(),
          const UserScreen(),
        ];
}
