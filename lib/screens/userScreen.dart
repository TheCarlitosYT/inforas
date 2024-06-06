import 'package:flutter/material.dart';
import 'package:inforas/services/login_service.dart';
import 'package:inforas/widgets/errorPopUp.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    LoginService CheckTokenScreen = new LoginService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        title: Text('Pantalla de usuario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20), 
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          userInfo(),
          Expanded(child: Container()), 
          settingsButton(context),
          SizedBox(height: 20),
          logOutButton(CheckTokenScreen ,context),
        ],
      ),
      ),
    );
  }

  Widget userInfo() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/Face2.png'),
        ),
        SizedBox(height: 20),
        Text(
          '¡Bienvenido/a! User',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget settingsButton(context) {
    return SizedBox(
      width: double.infinity, // Ancho máximo
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          ErrorPopup(
            title: 'De momento no hay nada', 
            message: 'Intentelo de nuevo en futuras versiones'
            ).showErrorPopup(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text('Settings', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget logOutButton(LoginService checkTokenService, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: (() {
                checkTokenService.logout();

                print('cerraste sesión');
                Navigator.pushReplacementNamed(context, '/login');
              }),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text('Cerrar Sesión', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}