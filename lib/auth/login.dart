import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'auth_service.dart';
import 'register.dart';
import 'package:proyecto/view/widgets/profile_avatar.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Función para iniciar sesión
  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      // Inicia sesión con el email y contraseña proporcionados
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      // Muestra un diálogo de error si la autenticación falla
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  // Función para navegar a la pantalla de registro
  void manejarRegistro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PantallaRegistro()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: -50,
            child: ProfileAvatar(radius: 100),
          ),
          Positioned(
            bottom: -90,
            left: 100,
            child: ProfileAvatar(radius: 100),
          ),
          Positioned(
            top: 100,
            right: -50,
            child: ProfileAvatar(radius: 80),
          ),
          Positioned(
            top: -10,
            right: -50,
            child: ProfileAvatar(radius: 80),
          ),
          Positioned(
            bottom: -40,
            right: -50,
            child: ProfileAvatar(radius: 80),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: ProfileAvatar(radius: 100),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CachedNetworkImage(
                          imageUrl: '',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 186, 184, 184),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 186, 184, 184),
                          labelText: 'Contraseña',
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => login(context),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 186, 184, 184),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: manejarRegistro,
                          child: const Text(
                            '¿No tienes una cuenta? Regístrate',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
