import 'package:rev_final/domain/auth/auth.dart';
import 'package:rev_final/domain/auth/auth_repository.dart';
import 'package:rev_final/domain/auth/credentials.dart';
import 'package:rev_final/shared/http_client/http_client.dart';
import 'package:rev_final/shared/token_storage/token_storage.dart';

import '../../domain/auth/auth_exception.dart';

class LasAuthRepository extends AuthRepository {
  final HttpClient _client;
  final TokenStorage _tokenStorage;

  LasAuthRepository({
    required HttpClient client,
    required TokenStorage tokenStorage,
  })  : _client = client,
        _tokenStorage = tokenStorage;

  @override
  Future<Auth> get auth async {
    final token = await _tokenStorage.token;
    if (token == null) {
      return Auth.unauthenticated;
    }
    return Auth.authenticated;
  }

  @override
  Future<void> login(Credentials credentials) async {
    try {
      final response = await _client.post<Json>(
        '/auth/login',
        body: {
          'cpf': credentials.cpf,
          'password': credentials.password,
        },
      );
      final token = response['token'];
      await _tokenStorage.setToken(token);
    } on HttpClientError catch (e) {
      if (e.statusCode == 401) {
        throw UserNotFoundException(e.message);
      }
      if (e.statusCode == 404) {
        throw InvalidCredentialsException(e.message);
      }
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _tokenStorage.deleteToken();
  }
}
