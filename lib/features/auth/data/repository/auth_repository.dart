import '../../service/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository() : authService = AuthService();

  Future<void> loginUser(
      {required String email, required String password}) async {
    await authService.loginUser(email, password);
  }
}
