import 'package:aluve_calendar_mobile/Views/Widgets/app_constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightPurple,
        toolbarHeight: MediaQuery.of(context).size.height / 5,
        centerTitle: true,
        title: Image.asset(
          'assets/images/Aluve_monochrome_black_1.png',
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
