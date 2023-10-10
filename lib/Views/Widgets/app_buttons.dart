import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class ButtonWithIcon extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Buttons button;

  const ButtonWithIcon(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: SignInButton(
        button,
        onPressed: onPressed,
        text: text,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
