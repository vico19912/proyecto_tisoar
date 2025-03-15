import 'package:proyecto/model/login_model.dart';

class LoginController {
  LoginModel? user;

  void login(String username, String password) {
    user = LoginModel(username: username, password: password);
    // Aquí puedes agregar la lógica de autenticación
    print('Usuario: $username, Contraseña: $password');
  }
}