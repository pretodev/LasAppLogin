typedef Json = Map<String, dynamic>;

class HttpClientError implements Exception {
  final int statusCode;
  final String message;

  HttpClientError({
    required this.statusCode,
    required this.message,
  });

  @override
  String toString() =>
      'HttpClientError(statusCode: $statusCode, message: $message)';
}

abstract class HttpClient {
  Future<T> get<T>(
    String url, {
    Map<String, String> headers,
    Map<String, dynamic> params,
  });

  Future<T> post<T>(
    String url, {
    Map<String, String> headers,
    Map<String, dynamic> params,
    dynamic body,
  });

  Future<T> put<T>(
    String url, {
    Map<String, String> headers,
    Map<String, dynamic> params,
    dynamic body,
  });

  Future<T> delete<T>(
    String url, {
    Map<String, String> headers,
    Map<String, dynamic> params,
  });

  Future<T> patch<T>(
    String url, {
    Map<String, String> headers,
    Map<String, dynamic> params,
    dynamic body,
  });
}
