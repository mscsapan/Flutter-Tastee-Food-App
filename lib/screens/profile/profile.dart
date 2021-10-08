import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/screens/home_screen.dart';
import 'package:my_food_application/screens/profile/update_profile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: mBlack, fontSize: 26.0)),
        backgroundColor: mTransparent,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () =>
                    goToNext(context: context, screen: UpdateProfile()),
                icon: FaIcon(
                  FontAwesomeIcons.pen,
                  color: mBlackDark,
                )),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/non2.jpg'),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${model!.userName}', style: profileStyle()),
                    Text('${model!.userEmail}', style: profileStyle())
                  ]),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () =>
                      goToNext(context: context, screen: HomeScreen()),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(mGreen900)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.home, size: 28),
                      SizedBox(width: 16.0),
                      Text('Home', style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

profileStyle() =>
    GoogleFonts.actor(fontSize: 25.0, fontWeight: FontWeight.bold);
