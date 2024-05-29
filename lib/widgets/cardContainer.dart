// ignore_for_file: file_names, prefer_const_constructors, unnecessary_this, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 0,
          maxHeight: double.infinity,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: createCardShape(),
        child: this.child,
      ),
    );
  }



  BoxDecoration createCardShape() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
      ]
    );
  }
}


  class CardContainerReg extends StatelessWidget {
  final Widget child;

  const CardContainerReg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 0,
          maxHeight: double.infinity,
        ),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: createCardShape(),
        child: this.child,
      ),
    );
  }
  BoxDecoration createCardShape() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
      ]
    );
  }
}