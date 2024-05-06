import 'package:flutter/material.dart';
import 'package:inforas/screens/login_screen.dart';
import 'package:inforas/screens/screens.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/login': (_) => LogInScreen(),
    '/register': (_) => RegistroScreen(),
  };
}