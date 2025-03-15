import 'package:flutter/material.dart';
import 'package:proyecto/model/productocliente.dart';
import 'package:proyecto/view/home_page.dart';
import 'package:proyecto/view/menu_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(BuildContext) onCarritoPressed;
  final List<Producto> productos;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onCarritoPressed,
    required this.productos,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 175, 174, 174),
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          iconSize: 30,
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuScreen(productos: productos),
                ),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            } else if (index == 2) {
              onCarritoPressed(context);
            }
            onTap(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
