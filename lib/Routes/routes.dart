import 'package:aluve_calendar_mobile/Views/intro_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String introScreen = '/';

  RouteManager._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case introScreen:
        return MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        );

      default:
        throw const FormatException('This Page does not exist!!');
    }
  }
}
