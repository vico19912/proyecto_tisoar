import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  // Instancia de FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Iniciar sesión con email y contraseña
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      // Intenta iniciar sesión con las credenciales proporcionadas
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Lanza una excepción si ocurre un error
      throw Exception(e.code);
    }
  }

  // Registrar un nuevo usuario con email y contraseña
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      // Crea un nuevo usuario con las credenciales proporcionadas
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Crea un documento de usuario en Firestore
      await createUserDocument(userCredential, email);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Lanza una excepción si ocurre un error
      throw Exception(e.code);
    }
  }

  // Crear un documento de usuario en Firestore
  Future<void> createUserDocument(
      UserCredential userCredential, String username) async {
    if (userCredential.user != null) {
      // Agrega un nuevo documento en la colección "Users" con el email del usuario como ID
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': username,
      });
    }
  }

  // Actualizar el nombre de usuario en Firestore
  Future<void> updateUser(String email, String username) async {
    await FirebaseFirestore.instance.collection("Users").doc(email).update({
      'username': username,
    });
  }

  // Eliminar un usuario de Firestore
  Future<void> deleteUser(String email) async {
    await FirebaseFirestore.instance.collection("Users").doc(email).delete();
  }

  // Cerrar sesión
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
