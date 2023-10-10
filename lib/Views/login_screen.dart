import 'package:aluve_calendar_mobile/Routes/routes.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_constants.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool _passwordVisible = false;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 39.15,
                ),
                Row(
                  children: [
                    Container(
                      //  color: purpleGrey,
                      width: MediaQuery.of(context).size.width / 2,
                      child: AppText(
                        text: 'Welcome Back.',
                        style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 39.15,
                ),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Email',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                          style: GoogleFonts.inter(fontSize: 14),
                          decoration: InputDecoration(
                              hintText: 'Enter email',
                              hintStyle: GoogleFonts.inter(
                                  fontStyle: FontStyle.italic),
                              suffixIcon: IconButton(
                                iconSize: 25,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.check,
                                  color: green,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 39.15,
                      ),
                      AppText(
                        text: 'Password',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          obscureText: _passwordVisible,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Enter password';
                            }
                            return null;
                          },
                          style: GoogleFonts.inter(fontSize: 14),
                          decoration: InputDecoration(
                              errorStyle: GoogleFonts.inter(
                                fontSize: 12,
                              ),
                              hintText: 'Enter password',
                              hintStyle: GoogleFonts.inter(
                                  fontStyle: FontStyle.italic),
                              suffixIcon: IconButton(
                                iconSize: 25,
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: AppText(
                              text: 'Forgot Password?',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: blue1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 39.15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: blue1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 50)),
                        onPressed: () {
                          _registerFormKey.currentState!.validate();
                          // Navigator.of(context)
                          //     .pushNamed(RouteManager.registerOptionsScreen);
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 39.15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.inter(
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  RouteManager.registerOptionsScreen);
                            },
                            child: AppText(
                              text: 'Register.',
                              style: GoogleFonts.inter(
                                  color: blue2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
