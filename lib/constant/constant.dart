import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mWhite = Color(0xFFFFFFFF);
Color mWhiteApp = Color(0xFFFAFAFA);
const mWhiteColor = Color(0xFFFFFFFF);
const mBlack = Color(0xFF000000);
const mBlack1 = Color(0xFF444449);
const mRed = Color(0xFFFF0000);
const mBlackDark = Color(0xFF424250);
const mOrange = Color(0xFFE65100);
const mDeepOrange1 = Color(0xFFFF0266);
const mOrange2 = Color(0xFFd70f65);
const mDeepOrange2 = Color(0xFFBF360C);
const Color mGreen900 = Color(0xFF1B5E20);
const mGreen800 = Color(0xFF2E7D32);
const mGreen700 = Color(0xFF388E3C);
const mGreen = Color(0xFF339e3d);
const mGrey600 = Color(0xFF757575);
const mGrey700 = Color(0xFF616161);
const mGrey800 = Color(0xFF212121);
const mGrey900 = Color(0xFF424242);
const mBlueGrey = Color(0xFF263238);
const mTransparent = Colors.transparent;

//profile Button
profileButton(
    {required String title, required Color color, required Function() onTap}) {
  return MaterialButton(
    onPressed: onTap,
    padding: EdgeInsets.all(6.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    color: color,
    textColor: mWhiteColor,
    child: Text(title),
  );
}

const mLinearGradient =
    LinearGradient(colors: [mGreen800, mGreen900, mGreen700]);
const mLinearGradient2 =
    LinearGradient(colors: [mDeepOrange1, mOrange, mDeepOrange2]);

//defaultBorder

UnderlineInputBorder defaultBorder =
    UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));

//defaultPadding
double defaultPadding = 16.0;

//input text field style
inputStyle() =>
    GoogleFonts.openSans(fontSize: 20.0, fontWeight: FontWeight.w400);

titleText({required String title}) {
  return Text(
    title,
    style: GoogleFonts.openSans(fontSize: 25.0, fontWeight: FontWeight.w600),
  );
}
