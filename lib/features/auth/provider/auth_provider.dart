import 'package:flutter/material.dart';
import '../data/repository/auth_repository.dart';
import 'package:logger/logger.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  final Logger _logger;

  AuthProvider()
      : _authRepository = AuthRepository(),
        _logger = Logger();

  bool _isLoading = false;
  bool _isLoggedIn = false;

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> loginUser(String email, String password) async {
    try {
      _isLoading = true;
      _isLoggedIn = false;

      await _authRepository.loginUser(email: email, password: password);
      _isLoggedIn = true;
      _isLoading = false;
    } catch (error) {
      _logger.e('Login Error occurred: $error');
      _isLoading = false;

      // Notify the UI to show a Snackbar with the login error message
      // (You can implement this part)
    } finally {
      notifyListeners();
    }
  }

  Future<void> registerUser(
      String email, String password, String confirmPassword) async {
    try {
      _isLoading = true;
      _isLoggedIn = false;

      await _authRepository.registerUser(
          email: email, password: password, confirmPassword: confirmPassword);
      _isLoggedIn = true;
      _isLoading = false;
    } catch (error) {
      _logger.e('Registration Error occurred: $error');
      _isLoading = false;

      // Notify the UI to show a Snackbar with the registration error message
      // (You can implement this part)
    } finally {
      notifyListeners();
    }
  }
}
