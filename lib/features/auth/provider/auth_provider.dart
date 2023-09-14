import '../data/repository/auth_repository.dart';
import 'package:logger/logger.dart';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  final Logger _logger;

  AuthProvider()
      : _authRepository = AuthRepository(),
        _logger = Logger();

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> registerUser(String email, String password) async {
    try {
      await _authRepository.registerUser(email: email, password: password);

      _isLoggedIn = true;

      notifyListeners();
    } catch (error) {
      _logger.e('Error occurred: $error');
    }
  }
}
