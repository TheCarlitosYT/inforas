import 'package:flutter/material.dart';

class LinkToScreens extends StatelessWidget {
  final String route;
  final String text;
  final String sufixText;

  const LinkToScreens(
      {required this.route, required this.text, required this.sufixText});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(this.sufixText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, this.route);
        },
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
