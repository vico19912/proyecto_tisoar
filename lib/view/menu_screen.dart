import 'package:flutter/material.dart';
import 'package:proyecto/view/food_screen.dart';
import 'package:proyecto/view/home_screen.dart';
import 'package:proyecto/view/widgets/bottom_navbar.dart';


class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 1; // Establecer el índice inicial

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navegación según el botón de la barra inferior seleccionado
    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Pantalla principal
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 450,
              height: 690,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(250),
                  bottom: Radius.circular(250),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMenuButton('Menú de Desayunos', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodScreen()),
                  );
                }),
                SizedBox(height: 20),
                _buildMenuButton('Menú de Almuerzos', () {
                  print('Menú de Almuerzos presionado');
                }),
                SizedBox(height: 20),
                _buildMenuButton('Otras Especialidades', () {
                  print('Otras Especialidades presionado');
                }),
                SizedBox(height: 20),
                _buildMenuButton('Bebidas', () {
                  print('Bebidas presionado');
                }),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  /// Método para crear botones del menú
  Widget _buildMenuButton(String title, VoidCallback onPressed) {
    return SizedBox(
      width: 250,
      height: 130,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed, // Ejecuta la función pasada como parámetro
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 28),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
