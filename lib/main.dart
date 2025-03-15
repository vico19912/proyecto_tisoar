import 'package:flutter/material.dart';
import 'package:proyecto/view/home_screen.dart';
import 'package:proyecto/view/login_screen.dart';
import 'package:proyecto/view/menu_screen.dart';
// Otras pantallas

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Inicia en la pantalla de login
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/menu': (context) => MenuScreen(), // Agrega más rutas si las necesitas
      },
    );
  }
}
