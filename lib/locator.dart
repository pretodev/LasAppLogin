import 'package:get_it/get_it.dart';
import 'package:rev_final/app/stores/auth_store.dart';
import 'package:rev_final/domain/auth/auth_repository.dart';
import 'package:rev_final/domain/user/user_repository.dart';
import 'package:rev_final/shared/http_client/http_client.dart';
import 'package:rev_final/shared/token_storage/token_storage.dart';

import 'data/auth/las_auth_repository.dart';
import 'data/user/las_user_respository.dart';
import 'shared/http_client/last_http_client.dart';
import 'shared/token_storage/las_token_storage.dart';

final i = GetIt.instance;

void setup() {
  GetIt.I.registerLazySingleton<TokenStorage>(
    () => LasTokenStorage(),
  );
  GetIt.I.registerLazySingleton<HttpClient>(
    () => LasHttpClient(tokenStorage: i()),
  );
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => LasAuthRepository(client: i(), tokenStorage: i()),
  );
  GetIt.I.registerLazySingleton<UserRepository>(
    () => LasUserRespository(client: i()),
  );
  GetIt.I.registerLazySingleton<AuthStore>(
    () => AuthStore(authRepository: i()),
  );
}
