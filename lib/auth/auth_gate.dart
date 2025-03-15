import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto/auth/login.dart';
import 'package:proyecto/view/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        // Escucha los cambios en el estado de autenticación del usuario
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Si el usuario está autenticado, muestra la página principal
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            // Si el usuario no está autenticado, muestra la pantalla de inicio de sesión
            return const PantallaLogin();
          }
        },
      ),
    );
  }
}
