// auth_middleware.dart

import 'token.dart';

class AuthMiddleware {
  final TokenManager _tokenManager = TokenManager();

  Future<bool> isAuthenticated() async {
    final token = await _tokenManager.getToken();
    return token != null && token.isNotEmpty;
  }

  Future<bool> protectRoute(String route) async {
    final isAuth = await isAuthenticated();

    if (!isAuth) {
      return false;
    }

    return true;
  }
}
