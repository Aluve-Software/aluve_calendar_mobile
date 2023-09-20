import './manage_shared_preferences.dart';

class AuthMiddleware {
  final ManageSharedPreferences _sharedPreferences = ManageSharedPreferences();

  Future<bool> isAuthenticated() async {
    final token = await _sharedPreferences.getAuthToken();
    final userData = await _sharedPreferences.getUserData();

    return token != null && token.isNotEmpty && userData != null;
  }

  Future<bool> protectRoute(String route) async {
    final isAuth = await isAuthenticated();

    if (!isAuth) {
      return false;
    }

    return true;
  }
}
