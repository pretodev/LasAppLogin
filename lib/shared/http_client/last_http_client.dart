import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rev_final/shared/http_client/http_client.dart';
import 'package:rev_final/shared/token_storage/token_storage.dart';

class LasHttpClient implements HttpClient {
  final _httpClient = http.Client();
  static const _urlBase = 'https://cubos-las-api.herokuapp.com';

  final TokenStorage _tokenStorage;

  LasHttpClient({
    required TokenStorage tokenStorage,
  }) : _tokenStorage = tokenStorage;

  @override
  Future<T> delete<T>(
    String path, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    final response = await _httpClient.delete(
      Uri.parse(_urlBase + path).replace(queryParameters: params),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode >= 400) {
      throw HttpClientError(
        statusCode: response.statusCode,
        message: json['message'],
      );
    }
    return json as T;
  }

  @override
  Future<T> get<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
  }) async {
    final token = await _tokenStorage.token;
    if (token != null) {
      headers = {
        ...headers,
        'Authorization': 'Bearer $token',
      };
    }
    final response = await _httpClient.get(
      Uri.parse(_urlBase + url).replace(queryParameters: params),
      headers: headers,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode >= 400) {
      throw HttpClientError(
        statusCode: response.statusCode,
        message: json['message'],
      );
    }
    return json as T;
  }

  @override
  Future<T> patch<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    body,
  }) async {
    final response = await _httpClient.patch(
      Uri.parse(_urlBase + url).replace(queryParameters: params),
      headers: headers,
      body: body,
    );
    return jsonDecode(response.body) as T;
  }

  @override
  Future<T> post<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    body,
  }) async {
    final response = await _httpClient.post(
      Uri.parse(_urlBase + url).replace(queryParameters: params),
      headers: headers,
      body: body,
    );
    final json = jsonDecode(response.body);
    if (response.statusCode >= 400) {
      throw HttpClientError(
        statusCode: response.statusCode,
        message: json['message'],
      );
    }
    return json as T;
  }

  @override
  Future<T> put<T>(
    String url, {
    Map<String, String> headers = const {},
    Map<String, dynamic> params = const {},
    body,
  }) async {
    final response = await _httpClient.put(
      Uri.parse(_urlBase + url).replace(queryParameters: params),
      headers: headers,
      body: body,
    );
    return jsonDecode(response.body) as T;
  }
}
