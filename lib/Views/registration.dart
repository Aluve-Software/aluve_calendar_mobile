import 'package:aluve_calendar_mobile/Views/Widgets/app_constants.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightPurple,
        toolbarHeight: MediaQuery.of(context).size.height / 2.5,
        centerTitle: true,
        title: Image.asset(
          'assets/images/Aluve_monochrome_black_1.png',
          alignment: Alignment.topLeft,
        ),
      ),
    );

  }

}