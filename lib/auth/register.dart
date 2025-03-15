import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:proyecto/auth/auth_service.dart';
import 'package:proyecto/view/home_page.dart';
import 'package:proyecto/view/widgets/profile_avatar.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Función para registrarse
  void register(BuildContext context) async {
    final _auth = AuthService();

    // Si coinciden las contraseñas, va a crear el usuario
    if (passwordController.text == confirmPasswordController.text) {
      try {
        // Crea un nuevo usuario con email y contraseña
        UserCredential userCredential = await _auth.signUpWithEmailPassword(
            emailController.text, passwordController.text);

        // Crea un documento de usuario en Firestore
        await _auth.createUserDocument(userCredential, usernameController.text);

        // Navega a la página principal después del registro exitoso
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } catch (e) {
        // Muestra un diálogo de error si el registro falla
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // Muestra un diálogo si las contraseñas no coinciden
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Las contraseñas no coinciden'),
        ),
      );
    }
  }

  void IrLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PantallaLogin()),
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
                        controller: usernameController,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 186, 184, 184),
                          labelText: 'Nombre de usuario',
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
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 186, 184, 184),
                          labelText: 'Confirmar Contraseña',
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
                        onTap: () => register(context),
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
                              "Registrarse",
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
                          onTap: IrLogin,
                          child: const Text(
                            '¿Ya tienes una cuenta? Inicia sesión',
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
