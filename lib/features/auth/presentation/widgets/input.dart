import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  const TextInputField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.isPassword,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          errorStyle: const TextStyle(color: Colors.red),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        style: const TextStyle(
            fontSize: 14, fontStyle: FontStyle.italic, fontFamily: "Inter"),
      ),
    );
  }
}
