import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ManageSharedPreferences {
  Future<void> storeTokenAndUserData(
      String token, Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    await prefs.setString('userData', jsonEncode(userData));
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      return jsonDecode(userDataJson) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    if (authToken != null) {
      return jsonDecode(authToken) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future<void> deleteTokenAndUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
    await prefs.remove('userData');
  }
}
