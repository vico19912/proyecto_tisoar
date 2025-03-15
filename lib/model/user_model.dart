class UserModel {
  final String name;
  final String description;
  final String username; // Agregado
  final String password; // Agregado

  UserModel({
    required this.name,
    required this.description,
    required this.username, // Corregido
    required this.password, // Corregido
  });
}
