import '../data/repository/auth_repository.dart';
import 'package:logger/logger.dart';

import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';


class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  final Logger _logger;

  AuthProvider()
      : _authRepository = AuthRepository(),
        _logger = Logger();

  bool _isEmailValid = true;

  bool _isLoading = false;
  bool _isLoggedIn = false;
  String _errorMessage = '';

  bool get isEmailValid => _isEmailValid;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  String get errorMessage => _errorMessage;

  void validateEmail(String email) {
    _isEmailValid = EmailValidator.validate(email);
    notifyListeners();
  }

  Future<void> loginUser(String email, String password) async {
    try {
      _isLoading = true;
      _isLoggedIn = false;
      _errorMessage = '';

      if (!_isEmailValid) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      await _authRepository.loginUser(email: email, password: password);


      _isLoggedIn = true;
      _isLoading = false;
    } catch (error) {
      _logger.e('Error occurred: $error');
      _errorMessage = 'Registration failed. Please try again.';
      _isLoading = false;
    } finally {
      notifyListeners();
    }
  }
}
