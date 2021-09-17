import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/controller/profile_update_controller.dart';
import 'package:my_food_application/custom/custom_button.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/screens/home_screen.dart';
import 'package:my_food_application/screens/profile/profile.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatelessWidget {
  TextEditingController nameController =
      TextEditingController(text: model.userName);
  TextEditingController emailController =
      TextEditingController(text: model.userEmail);
  @override
  Widget build(BuildContext context) {
    ProfileUpdateController update =
        Provider.of<ProfileUpdateController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile',
            style: TextStyle(color: mBlack, fontSize: 26.0)),
        backgroundColor: mTransparent,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => goToNext(context: context, screen: ProfileScreen()),
          color: mBlack,
          icon: FaIcon(FontAwesomeIcons.times),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        focusedBorder: defaultBorder,
                        border: defaultBorder,
                        hintText: model.userName),
                    style: inputStyle(),
                    controller: nameController,
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        focusedBorder: defaultBorder,
                        border: defaultBorder,
                        hintText: model.userEmail),
                    style: inputStyle(),
                  ),
                  SizedBox(height: 20.0),
                  myButton(
                      title: 'Update',
                      onTap: () {
                        update.updateProfile(
                            context, nameController, emailController);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
