import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforas/navigation_menu.dart';
import 'package:inforas/screens/login_screen.dart';
import 'package:inforas/services/login_service.dart';
import 'package:provider/provider.dart';

class CheckTokenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checkTokenService = Provider.of<LoginService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: checkTokenService.isAuthenticated(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => LogInScreen(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              });
            } else {
              Future.microtask(() {
                Get.to(() => const NavigationMenu(index: 0,));
              });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
