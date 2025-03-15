import 'package:proyecto/model/user_model.dart';

class HomeController {
  UserModel getUser() {
    return UserModel(
      name: 'Tisoar',
      description: 'Lorem ipsum has been the industry\'s simply dummy text.',
      username: 'tisoar_user',  // Añadido
      password: '123456',        // Añadido
    );
  }
}
