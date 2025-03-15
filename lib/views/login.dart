import 'package:flutter/material.dart';

import 'screens/principal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  //final TextEditingController _emailController = TextEditingController();
  //final TextEditingController _passwordController = TextEditingController();

  void _login() {
    //String email = _emailController.text;
    //String password = _passwordController.text;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainUserBody()),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/logo.jpeg"), // Imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen agregada arriba del formulario
              Image.asset(
                'assets/logo.jpeg',
                height: 150,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  elevation: 0, // Sin sombra
                ),
                child: Text("Usuario"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  elevation: 0,
                ),
                child: Text("Contraseña"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
