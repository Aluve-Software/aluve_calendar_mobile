import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../widgets/button.dart';
import '../widgets/input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                width: double.infinity,
                color: const Color(0XFFD6B9ED),
                child: Image.asset("assets/Aluve_monochrome_black.png"),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff202020),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Back.",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff202020),
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff313037),
                            height: 22 / 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      TextInputField(
                        labelText: "Enter email",
                        controller: _emailController,
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email required.';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Enter valid email.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff313037),
                            height: 22 / 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      TextInputField(
                        labelText: "Enter password",
                        controller: _passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      TextInputField(
                        labelText: "Enter password again",
                        controller: _passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Button(
                        text: "Sign In",
                        onPressed: () async {
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();

                          if (_formKey.currentState!.validate()) {
                            authProvider.loginUser(email, password);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Register success"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 16,
                              height: 22 / 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            " Sign in.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 22 / 16,
                              color: Color(0XFF369FF7),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
