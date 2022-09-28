import 'package:rev_final/domain/auth/auth.dart';
import 'package:rev_final/domain/auth/credentials.dart';

abstract class AuthRepository {
  Future<Auth> get auth;

  Future<void> login(Credentials credentials);

  Future<void> logout();
}
