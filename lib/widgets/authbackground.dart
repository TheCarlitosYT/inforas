import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
final Widget child;

  const AuthBackground({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
        body: Stack(
          children: [
            PurpleBox(),
            _HeaderIcon(),
            this.child,
          ],
        )
      );
  }
}

class PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.4,
        width: double.infinity,
        decoration: _purpleBG(),
        child: Stack(
          children: [
            Positioned(top: 90, left:   30, child: Bubble(),),
            Positioned(top: -40, right: -30, child: Bubble(),),
            Positioned(bottom: -50, right: -10, child: Bubble(),),
            Positioned(bottom: 120, right: 20, child: Bubble(),),
            Positioned(bottom: -50, left: -20, child: Bubble(),),
          ],
        )
      );
  }

  BoxDecoration _purpleBG() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 93, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0)
        ]));
  }

}
class _HeaderIcon extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        child: Icon(Icons.person_pin, size: 100, color: Colors.white),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}

