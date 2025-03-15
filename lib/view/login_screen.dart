import 'package:flutter/material.dart';
import 'package:proyecto/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = LoginController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showUserField = false;
  bool showPasswordField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showUserField = !showUserField;
                      });
                    },
                    child: Text('Usuario'),
                  ),
                  if (showUserField)
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(hintText: 'Ingrese su usuario'),
                    ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showPasswordField = !showPasswordField;
                      });
                    },
                    child: Text('Contraseña'),
                  ),
                  if (showPasswordField)
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Ingrese su contraseña'),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _controller.login(_usernameController.text, _passwordController.text);

                      // Navegar a HomeScreen después del login
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
