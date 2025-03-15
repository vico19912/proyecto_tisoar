import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto/auth/auth_service.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  // Función para actualizar el nombre de usuario
  void _updateUser(BuildContext context, String email, String currentUsername) {
    final TextEditingController usernameController =
        TextEditingController(text: currentUsername);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Actualizar Usuario'),
        content: TextField(
          controller: usernameController,
          decoration: const InputDecoration(labelText: 'Nuevo Usuario'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Actualiza el nombre de usuario en Firestore
              AuthService().updateUser(email, usernameController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Actualizar'),
          ),
        ],
      ),
    );
  }

  // Función para eliminar un usuario
  void _deleteUser(BuildContext context, String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Usuario'),
        content:
            const Text('¿Estás seguro de que deseas eliminar este usuario?'),
        actions: [
          TextButton(
            onPressed: () {
              // Elimina el usuario de Firestore
              AuthService().deleteUser(email);
              Navigator.of(context).pop();
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
      ),
      body: StreamBuilder(
        // Escucha los cambios en la colección "Users" de Firestore
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Algo Malo Paso"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return const Center(child: Text("No hay datos"));
          }

          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user['username']),
                subtitle: Text(user['email']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          _updateUser(context, user['email'], user['username']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteUser(context, user['email']),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
