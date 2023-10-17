import 'package:aluve_calendar_mobile/Routes/routes.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_buttons.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_constants.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';

class RegisterOptionsScreen extends StatefulWidget {
  const RegisterOptionsScreen({super.key});

  @override
  State<RegisterOptionsScreen> createState() => _RegisterOptionsScreenState();
}

class _RegisterOptionsScreenState extends State<RegisterOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: lightPurple,
                ),
                height: MediaQuery.of(context).size.height / 2.5,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 9.79),
                  child: Image.asset(
                    'assets/images/Aluve_monochrome_black_1.png',
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: white,
                ),
                height: MediaQuery.of(context).size.height / 1.67,
              ),
            ],
          ),
          Center(
              child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 17,
                right: MediaQuery.of(context).size.width / 17,
                top: MediaQuery.of(context).size.height / 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/time.png',
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                ButtonWithIcon(
                    onPressed: () {
                      Navigator.of(context)
                      .pushNamed(RouteManager.registrationScreen);
                      print(MediaQuery.of(context).size.height / 9.79);
                    },
                    text: 'Register with email',
                    button: Buttons.email),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 39.15,
                ),
                ButtonWithIcon(
                  onPressed: () {},
                  text: 'Register with Google',
                  button: Buttons.google,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 39.15,
                ),
                ButtonWithIcon(
                  onPressed: () {},
                  text: 'Register with Facebook',
                  button: Buttons.facebookNew,
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
                        Navigator.of(context).pop();
                      },
                      child: AppText(
                        text: 'Sign in',
                        style: GoogleFonts.inter(
                            color: blue2,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      //  const Text(
                      //   "Sign In",
                      //   style: TextStyle(
                      //       fontSize: 15, fontWeight: FontWeight.bold),
                      // ),
                    )
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
