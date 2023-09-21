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
      const String loginURL = "https://dummyjson.com/auth/login";
      final response = await _dio
          .post(loginURL, data: {'username': email, 'password': password});
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

  Future<void> registerUser(
      String email, String password, String confirmPassword) async {
    try {
      const String registerURL = "https://dummyjson.com/auth/register";
      final response = await _dio.post(registerURL, data: {
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword
      });
      if (response.statusCode == 200) {
        _logger.i("Registration Successful, Token");
      } else {
        _logger.w("Registration Failed");
      }
    } catch (error) {
      _logger.e("Error occured: $error");
      throw 'Registration failed. $error';
    }
  }

  Future<void> logoutUser() async {
    try {
      final response = await _dio.post("https://dummyjson.com/auth/logout");

      if (response.statusCode == 200) {
        await _sharedPreferences.deleteTokenAndUserData();

        _logger.i("Logout Successful");
      } else {
        _logger.w("Logout Failed: Server returned ${response.statusCode}");
        throw 'Logout failed. Server returned ${response.statusCode}';
      }
    } catch (error) {
      _logger.e('Error occurred during logout: $error');
      throw 'Logout failed. $error';
    }
  }
}
