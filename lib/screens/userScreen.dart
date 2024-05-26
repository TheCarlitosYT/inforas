import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});  

  @override
  Widget build(BuildContext context) {
    //Codeium, let's do a simple user screen in Flutter, let's do it in Spanish (Español ES)
    return Container(
      child: Text("User Screen"),
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 255, 255)
      ),
      //Text("User Screen")
    );
  }
}