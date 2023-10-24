import 'package:aluve_calendar_mobile/Routes/routes.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_constants.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_text.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _resetPasswordKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  bool isRequestSent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: lightPurple,
        toolbarHeight: MediaQuery.of(context).size.height / 3,
        title: Image.asset(
          'assets/images/confused_1.png',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.height / 2.5,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: white,
        ),
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height / 2.625),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 17,
                  right: MediaQuery.of(context).size.width / 17,
                  bottom: MediaQuery.of(context).size.height / 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'assets/images/confused_1.png',
                  //   fit: BoxFit.fill,
                  //   height: MediaQuery.of(context).size.height / 2.5,
                  //   width: MediaQuery.of(context).size.height / 2.5,
                  // ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: AppText(
                          text: 'Oops, forgot password?',
                          style: GoogleFonts.inter(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  AppText(
                    text: 'Enter the email address you used to register',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Form(
                    key: _resetPasswordKey,
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
                          controller: emailcontroller,
                          hintText: 'Enter email',
                          hasTrailingIconButton: false,
                          hasTrailingIcon: false,
                          hideText: false,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: blue1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                    onPressed: () {
                      if (_resetPasswordKey.currentState!.validate()) {}

                      // Navigator.of(context)
                      //     .pushNamed(RouteManager.registerOptionsScreen);
                    },
                    child: Text(
                      'Reset Password',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 45,
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
                          Navigator.of(context)
                              .pushNamed(RouteManager.registerOptionsScreen);
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
          ),
        ),
      ),
    );
  }
}
