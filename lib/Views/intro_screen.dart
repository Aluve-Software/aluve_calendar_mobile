<<<<<<< HEAD
=======
import 'package:aluve_calendar_mobile/Views/Widgets/app_constants.dart';
>>>>>>> parent of fa52326 (use the app text widget to display the intro screen text)
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const Scaffold();
=======
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Image.asset(
                    'assets/images/Aluve_monochrome_black_1.png',
                    alignment: Alignment.topCenter,
                  ),
                ),
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
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
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/time.png',
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Text(
                  'This can be some info that tells the user a little bit about what the app can do for them. Sells makes them excited to sign up. Bla bla.',
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
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
                    ))
              ],
            ),
          )),
        ],
      ),
    );
>>>>>>> parent of fa52326 (use the app text widget to display the intro screen text)
  }
}
