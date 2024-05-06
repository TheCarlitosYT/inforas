import 'package:flutter/material.dart';
import 'package:inforas/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfoRAS',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: getApplicationRoutes(),
    );
  }
}
  