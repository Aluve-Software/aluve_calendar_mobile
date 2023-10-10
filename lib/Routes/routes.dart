import 'package:aluve_calendar_mobile/Views/intro_screen.dart';
import 'package:aluve_calendar_mobile/Views/register_options_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String introScreen = '/';
  static const String registerOptionsScreen = '/registerOptionsScreen';

  RouteManager._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case introScreen:
        return MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        );
      case registerOptionsScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterOptionsScreen(),
        );

      default:
        throw const FormatException('This Page does not exist!!');
    }
  }
}
