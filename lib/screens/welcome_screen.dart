import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/custom/custom_button.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/screens/authenticate/toggle_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> logos = [
    'assets/images/logo1.png',
    'assets/images/logo2.png',
    'assets/images/logo3.png',
    'assets/images/logo4.png',
  ];

  int _currentPosition = 0;

  buildDots({required int position}) {
    return Container(
      height: 10.0,
      width: _currentPosition == position ? 22.0 : 10.0,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _currentPosition == position ? mDeepOrange1 : Color(0xFFD8D8D8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to ms commerce',
                style: GoogleFonts.kalam(fontSize: 30)),
            Container(
              height: 400.0,
              width: double.infinity,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(
                    () => _currentPosition = value,
                  );
                },
                itemCount: logos.length,
                itemBuilder: (context, index) {
                  return Image.asset(logos[index]);
                },
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    logos.length, (index) => buildDots(position: index))),
            SizedBox(height: 35.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: myButton(
                title: 'LogIn',
                onTap: () => goToNext(context: context, screen: ToggleScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
