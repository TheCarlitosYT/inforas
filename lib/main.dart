// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inforas/providers/documentos_provider.dart';
import 'package:inforas/providers/events_provider.dart';
import 'package:inforas/routes/routes.dart';
import 'package:inforas/services/documento_service.dart';
import 'package:inforas/services/evento_service.dart';
import 'package:inforas/services/login_service.dart';
import 'package:inforas/services/usuario_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'AIzaSyA3GAv_6v_Rvm5IddhG-kCjcDTPJnLkGeo',
    appId: '1:893697249561:android:43aaafdd92bb5d0837b588',
    messagingSenderId: '893697249561',
    projectId: 'inforas-8f462',
    storageBucket: 'inforas-8f462.appspot.com',
  ));
  runApp(const AppState());
}


class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Descomentar y borrar esto cuando lo tenga implementado, esto servirá y mucho
        // ChangeNotifierProvider(create: (_) => ClienteService(), lazy: false),
        // ChangeNotifierProvider(create: (_) => FavoritoService(), lazy: false),
        // ChangeNotifierProvider(create: (_) => IncidenciaService(), lazy: false),
        // ChangeNotifierProvider(create: (_) => LoginService(), lazy: false),
        ChangeNotifierProvider(create: (_) => EventoService(), lazy: false),
        ChangeNotifierProvider(create: (_) => UsuarioService(), lazy: false,),
        ChangeNotifierProvider(create: (_) => DocumentoService(), lazy: false),
        ChangeNotifierProvider(create: (_) => EventsProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => DocumentsProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => LoginService(), lazy: false,),

      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'InfoRAS',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: getApplicationRoutes(),
    );
  }
}
