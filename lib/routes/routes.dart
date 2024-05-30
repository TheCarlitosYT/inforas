import 'package:flutter/material.dart';
import 'package:inforas/screens/document_edit_page.dart';
import 'package:inforas/screens/screens.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/login': (_) => LogInScreen(),
    '/register': (_) => RegisterScreen(),
    '/home': (_) => homeScreen(),
    '/form': (_) => DocumentEditingPage(),
    '/calendar': (_) => CalendarScreen(),
    '/eventoform': (_) => EventEditingPage(),
  };
}