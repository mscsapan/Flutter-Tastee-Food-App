import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_food_application/constant/constant.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final GlobalKey<ScaffoldState> key;
  InputField(
      {required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.key,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: TextFormField(
        decoration: InputDecoration(
            border: defaultBorder,
            focusedBorder: defaultBorder,
            hintText: hintText,
            suffixIcon: suffixIcon),
        obscureText: obscureText,
        style:
            GoogleFonts.openSans(fontSize: 20.0, fontWeight: FontWeight.w400),
      ),
    );
  }
}
