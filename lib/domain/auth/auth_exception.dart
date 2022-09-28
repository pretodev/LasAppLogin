enum AuthErrors {
  userNotFound,
  invalidCredentials,
}

class AuthException {
  final String message;
  final AuthErrors error;

  const AuthException._(this.message, this.error);

  static AuthException invalidCredentials() {
    return const AuthException._(
      'Credenciais inválidas',
      AuthErrors.invalidCredentials,
    );
  }

  static AuthException userNotFound() {
    return const AuthException._(
      'Usuário não encontrado',
      AuthErrors.userNotFound,
    );
  }
}

class UserNotFoundException implements Exception {
  final String message;

  const UserNotFoundException(this.message);
}

class InvalidCredentialsException implements Exception {
  final String message;

  const InvalidCredentialsException(this.message);
}
