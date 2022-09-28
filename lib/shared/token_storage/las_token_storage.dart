import 'package:rev_final/shared/token_storage/token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LasTokenStorage implements TokenStorage {
  static const _key = 'las.auth.token';

  @override
  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

  @override
  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }

  @override
  // TODO: implement token
  Future<String?> get token async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }
}
