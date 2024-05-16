// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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


    // if (productsService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        actions: [
        IconButton(
          onPressed: (() {
            // authService.logout();
            
            print('cerraste sesión');
            Navigator.pushReplacementNamed(context, '/login');
          }), 
          icon: Icon(Icons.logout_outlined, color: const Color.fromARGB(255, 0, 0, 0),)
        )
        ],
      ),
      body: ListView.builder(
        itemCount: /*productsService.products.length*/ 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: /*Text('Item: $index')*/ documentCard(/*product: productsService.products[index]*/ testName: "Titulo", desc: "Descripcion numero ${index + 1}",),
            onTap: () {
              // productsService.selectedProduct = productsService.products[index].copy();
              // Navigator.pushNamed(context, 'product');
              print('Hola buenas noches');
              Navigator.pushNamed(context, '/form');
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
