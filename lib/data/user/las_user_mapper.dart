import '../../domain/user/user.dart';
import '../../shared/http_client/http_client.dart';

class LasUserMapper {
  static User fromJson(Json json) {
    return User(
      id: json['id'],
      name: json['fullName'],
      email: json['contacts']['email'],
      cpf: json['cpf'],
    );
  }
}
