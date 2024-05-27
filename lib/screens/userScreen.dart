import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key}); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple, // Cabecera morada
        title: Text('Pantalla de Usuario'), // Título de la pantalla
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Correo electrónico: usuario@example.com', // Texto del correo electrónico
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20), // Espacio entre el texto y los botones
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de Settings
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color azul
              ),
              child: Text('Settings', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20), // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de Cerrar Sesión
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Color rojo
              ),
              child: Text('Cerrar Sesión', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
