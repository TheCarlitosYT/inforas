import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final String textImage;
  final String text;

  const AppBarCustom({required this.textImage, required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image(
            image: AssetImage(this.textImage),
            height: 180,
          ),
          Container(
            child: Center(
              child: Text(
                this.text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
          )
        ],
      ),
    );
  }
}
