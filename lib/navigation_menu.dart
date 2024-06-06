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

// // 2.0
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:inforas/screens/screens.dart';
// import 'package:inforas/screens/userScreen.dart';

// class NavigationMenu extends StatelessWidget {
//   final int? index;
//   const NavigationMenu({Key? key, this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController(index: index));

//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) => controller.selectedIndex.value = index,
//           backgroundColor: Colors.white,
//           // ignore: prefer_const_literals_to_create_immutables
//           destinations: [
//             NavigationDestination(icon: Icon(Iconsax.document), label: 'Documentos'),
//             NavigationDestination(icon: Icon(Iconsax.calendar), label: 'Eventos'),
//             NavigationDestination(icon: Icon(Iconsax.personalcard), label: 'Perfil'),
//           ],
//         ),
//       ),
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex;
//   final List<Widget> screens;

//   NavigationController({int? index})
//       : selectedIndex = (index ?? 0).obs,
//         screens = [
//           homeScreen(),
//           const CalendarScreen(),
//           const UserScreen(),
//         ];
// }

// // 3.0

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:inforas/screens/screens.dart';
import 'package:inforas/screens/userScreen.dart';

class NavigationMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationMenuController navigationMenuController = Get.put(NavigationMenuController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: navigationMenuController.selectedIndex.value,
          onDestinationSelected: (index) => navigationMenuController.updateSelectedIndex(index),
          backgroundColor: Colors.white,
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.document), label: 'Documentos'),
            NavigationDestination(icon: Icon(Iconsax.calendar), label: 'Eventos'),
            NavigationDestination(icon: Icon(Iconsax.personalcard), label: 'Perfil'),
          ],
        ),
      ),
      body: Obx(
        () {
          switch (navigationMenuController.selectedIndex.value) {
            case 0:
              return homeScreen();
            case 1:
              return CalendarScreen();
            case 2:
              return UserScreen();
            default:
              return homeScreen(); // Puedes devolver una página de error o una página vacía
          }
        },
      ),
    );
  }
}


