import 'package:flutter/material.dart';
import 'package:proyecto/auth/auth_service.dart';
import 'package:proyecto/view//profile_page.dart';
import 'package:proyecto/view/users_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 186, 184,
                      184), // Cambia el color de fondo según tus necesidades
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Perfil'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.group),
                  title: Text('Users'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UsersPage()),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar sesión'),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
