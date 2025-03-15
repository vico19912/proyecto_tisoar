import 'package:flutter/material.dart';
import 'package:proyecto/view/widgets/bottom_navbar.dart';
import 'package:proyecto/view/widgets/profile_avatar.dart';
import 'package:proyecto/view/widgets/text_card.dart';
import 'menu_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          Column(
            children: [
              SizedBox(height: 50),
              ProfileAvatar(radius: 50),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextCard(),
              ),
              SizedBox(height: 100),
              ProfileAvatar(radius: 50),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Home está en la posición 1
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()),
            );
          } else if (index == 1) {
            // Ya estamos en HomeScreen, no hacemos nada
          } 
        },
      ),
    );
  }
}
