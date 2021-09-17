import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_food_application/constant/constant.dart';

class AlreadyAccount extends StatelessWidget {
  final String message;
  final String title;
  final Function() onTap;
  const AlreadyAccount(
      {required this.title, required this.message, required this.onTap});
  isAccountStyle() =>
      GoogleFonts.roboto(fontSize: 16.5, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: defaultPadding + 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            message,
            style: isAccountStyle(),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              title.toUpperCase(),
              style: isAccountStyle().copyWith(
                  fontSize: 15.0, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
