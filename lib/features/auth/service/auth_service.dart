//  handles the communication with the backend API

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AuthService {
  final Dio _dio;
  final Logger _logger;

  AuthService()
      : _dio = Dio(),
        _logger = Logger();

  Future<void> loginUser(String email, String password) async {

    try {
      const String registerURL = "https://dummyjson.com/products/1";
      final response = await _dio
          .post(registerURL, data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        _logger.i("Registration Successful");
      } else {
        _logger.w("Registration Failed");
      }
    } catch (error) {
      _logger.e('Error occurred: $error');
    }
  }
}
