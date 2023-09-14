//  handles the communication with the backend API

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../token.dart';

class AuthService {
  final Dio _dio;
  final Logger _logger;
  final TokenManager _tokenManager = TokenManager();

  AuthService()
      : _dio = Dio(),
        _logger = Logger();

  Future<void> loginUser(String email, String password) async {
    try {
      const String registerURL = "https://dummyjson.com/auth/login";
      final response = await _dio
          .post(registerURL, data: {'username': email, 'password': password});
      if (response.statusCode == 200) {
        final token = response.data['token'] as String;

        _logger.i("Login Successful, Token: $token");

        await _tokenManager.storeToken(token);

        _logger.i("Token stored successfully");
      } else {
        _logger.w("Login Failed");
      }
    } catch (error) {
      _logger.e('Error occurred: $error');
      throw 'Login failed. $error';
    }
  }
}
