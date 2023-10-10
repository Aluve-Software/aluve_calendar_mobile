import 'package:aluve_calendar_mobile/Views/Widgets/app_constants.dart';
import 'package:aluve_calendar_mobile/Views/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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
                  padding: const EdgeInsets.only(top: 80),
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
                top: MediaQuery.of(context).size.height / 10),
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
                AppText(
                    text:
                        'This can be some info that tells the user a little bit about what the app can do for them. Sells makes them excited to sign up. Bla bla.',
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: blue1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                  onPressed: () {},
                  child: Text(
                    'Let\'s Go',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
