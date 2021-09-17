import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_application/controller/registration_validate_controller.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/screens/home_screen.dart';

class ProfileUpdateController with ChangeNotifier {
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  updateProfile(BuildContext context, TextEditingController name, email) async {
    if (name.text.trim().isEmpty) {
      warning.showSnackBar(context, 'Field can\'t be Empty');
      return;
    } /*else if (name.text.contains(model.userName)) {
      warning.showSnackBar(context, 'You\'ve inserted your same name');
      return;
    }*/
    else if (email.text.trim().isEmpty) {
      warning.showSnackBar(context, 'Field can\'t be Empty');
      return;
    } /*else if (email.text.contains(model.userEmail)) {
      warning.showSnackBar(context, 'You\'ve inserted your same email');
      return;
    }*/
    else if (!email.text.contains('@')) {
      warning.showSnackBar(context, 'You\'ve inserted your same email');
      return;
    } else {
      loading = true;
      notifyListeners();
      FirebaseFirestore.instance
          .collection('user')
          .doc(_auth.currentUser!.uid)
          .update({"name": name.text, "email": email.text}).then((value) {
        loading = false;
        notifyListeners();
        goToNext(context: context, screen: HomeScreen());
      });
    }
  }
}
