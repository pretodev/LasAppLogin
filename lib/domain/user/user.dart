class User {
  final int id;
  final String name;
  final String email;
  final String cpf;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, cpf: $cpf)';
  }
}
