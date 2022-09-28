abstract class TokenStorage {
  Future<String?> get token;

  Future<void> setToken(String token);

  Future<void> deleteToken();
}
