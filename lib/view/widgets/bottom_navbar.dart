import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
    final int currentIndex;
  final Function(int) onTap;
  
  BottomNavBar({required this.currentIndex, required this.onTap});

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
          onTap:onTap,
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
