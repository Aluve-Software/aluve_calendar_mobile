import '../../service/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository() : authService = AuthService();

  Future<void> loginUser(
      {required String email, required String password}) async {
    await authService.loginUser(email, password);
  }

  Future<void> registerUser(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    await authService.registerUser(email, password, confirmPassword);
  }

  Future<void> logoutUser() async {
    await authService.logoutUser();
  }
}
