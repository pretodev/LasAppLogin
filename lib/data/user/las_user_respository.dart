import 'package:rev_final/data/user/las_user_mapper.dart';
import 'package:rev_final/domain/user/user.dart';
import 'package:rev_final/domain/user/user_repository.dart';

import '../../shared/http_client/http_client.dart';

class LasUserRespository implements UserRepository {
  final HttpClient _client;

  LasUserRespository({
    required HttpClient client,
  }) : _client = client;

  @override
  Future<User> update(User user) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<User> get user async {
    final response = await _client.get<Json>('/user');
    return LasUserMapper.fromJson(response);
  }
}
