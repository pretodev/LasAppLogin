import 'package:rev_final/domain/user/user.dart';

abstract class UserRepository {
  Future<User> get user;

  Future<User> update(User user);
}
