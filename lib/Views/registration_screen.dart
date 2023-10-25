import 'package:aluve_calendar_mobile/Routes/routes.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_constants.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_text.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late bool _passwordVisible = false;

  @override
  void initState() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightPurple,
        toolbarHeight: MediaQuery.of(context).size.height / 6,
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20
                        ),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width / 2,
                      child: AppText(
                        text: 'Create an account.',
                        style: GoogleFonts.inter(
                          fontSize: 35,
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
                      AppTextField(
                        hintText: 'Enter email',
                        trailingIcon: Icons.check,
                        trailingIconColor: green,
                        hasTrailingIconButton: false,
                        hasTrailingIcon: true,
                        hideText: false,
                        validator: (email) {
                          if(email == null || email.isEmpty) {
                            return 'Enter email';
                          }
                          if(!email.contains('@') || !email.contains('.')) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
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
                      AppTextField(
                        hintText: 'Enter Password',
                        trailingIcon: _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        hasTrailingIconButton: true,
                        hasTrailingIcon: true,
                        onTrailingIconPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        hideText: _passwordVisible,
                        validator: (password) {

                        },

                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 39.15,
                      ),
                      AppText(
                        text: 'Confirm Password',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      AppTextField(
                          hintText: 'Enter password again',
                          trailingIcon: _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                          hasTrailingIconButton: true,
                          hasTrailingIcon: true,
                          onTrailingIconPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          hideText: _passwordVisible,
                          validator: (confirm) {

                          },

                        //   if (password == null || password.isEmpty) {
                        //     return 'Confirm password';
                        //   }
                        //   return null;
                        // },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 39.15,
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
                          //     .pushNamed(RouteManager.loginScreen);
                        },
                        child: Text(
                          'Register',
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
                            "Already have an account?",
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
                              text: 'Sign in.',
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