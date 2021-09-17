import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_food_application/constant/constant.dart';

myButton({required String title, required Function() onTap}) {
  return SizedBox(
    width: double.infinity,
    height: 60.0,
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      onPressed: onTap,
      child: Text(title,
          style: GoogleFonts.openSans(
              fontSize: 22.0,
              color: Colors.white,
              fontWeight: FontWeight.normal)),
      color: Colors.green,
    ),
  );
}

myButton2({required String title, required Function() onTap}) {
  return SizedBox(
    width: double.infinity,
    height: 60.0,
    child: MaterialButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: mOrange, width: 2),
          borderRadius: BorderRadius.circular(6.0)),
      onPressed: onTap,
      child: Text(title,
          style: GoogleFonts.openSans(
              fontSize: 22.0,
              color: mBlackDark,
              fontWeight: FontWeight.normal)),
    ),
  );
}
