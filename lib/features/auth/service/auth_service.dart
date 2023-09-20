//  handles the communication with the backend API

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../manage_shared_preferences.dart';

class AuthService {
  final Dio _dio;
  final Logger _logger;
  final ManageSharedPreferences _sharedPreferences = ManageSharedPreferences();

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
        final userData = response.data as Map<String, dynamic>;

        _logger.i("Login Successful, Token: $token");

        await _sharedPreferences.storeTokenAndUserData(token, userData);

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
