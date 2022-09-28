import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rev_final/domain/auth/auth_repository.dart';

import '../../domain/auth/auth.dart';
import '../../domain/auth/credentials.dart';

class AuthStore extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthStore({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Auth _auth = Auth.none;

  Auth get auth => _auth;

  void loadAuth() async {
    _auth = await _authRepository.auth;
    notifyListeners();
  }

  Future<void> login(Credentials credentials) async {
    await _authRepository.login(credentials);
    loadAuth();
  }

  Future<void> logout() async {
    await _authRepository.logout();
    loadAuth();
  }
}

class AuthWidget extends InheritedNotifier<AuthStore> {
  AuthWidget({
    super.key,
    required AuthRepository authRepository,
    required super.child,
  }) : super(
          notifier: AuthStore(authRepository: authRepository),
        );

  static AuthStore of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AuthWidget>();
    return widget!.notifier as AuthStore;
  }
}
