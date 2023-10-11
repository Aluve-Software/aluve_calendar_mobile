import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final bool hideText;
  final String? Function(String?)? validator;
  final bool hasTrailingIconButton;
  final void Function()? onTrailingIconPressed;
  final bool hasTrailingIcon;
  final IconData? trailingIcon;
  final Color? trailingIconColor;
  const AppTextField({
    super.key,
    required this.hintText,
    this.trailingIcon,
    required this.hasTrailingIconButton,
    required this.hasTrailingIcon,
    this.trailingIconColor,
    this.onTrailingIconPressed,
    required this.hideText,
    required this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        obscureText: widget.hideText,
        validator: widget.validator,
        style: GoogleFonts.inter(fontSize: 14),
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.inter(fontStyle: FontStyle.italic),
            suffixIcon: widget.hasTrailingIconButton == false
                //=====if the textfield does not have a trailing icon button we display only a normal icon====
                ? widget.hasTrailingIcon == true
                    //but if the texfield has a trailing normal icon then we display an icon otherwise we place a sixed box
                    ? Icon(
                        widget.trailingIcon,
                        color: widget.trailingIconColor,
                      )
                    : const SizedBox()
                //====if the textfield does have a trailing icon button we display the IconButton=====
                : IconButton(
                    iconSize: 25,
                    onPressed: widget.onTrailingIconPressed,
                    icon: Icon(
                      widget.trailingIcon,
                      color: widget.trailingIconColor,
                    ),
                  ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
