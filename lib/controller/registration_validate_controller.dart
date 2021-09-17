import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/custom/snack_bar.dart';
import 'package:my_food_application/database/database.dart';
import 'package:my_food_application/screens/home_screen.dart';

ShowWarning warning = new ShowWarning();

class RegistrationController with ChangeNotifier {
  //Authentication _auth = new Authentication();
  Database db = new Database();

  UserCredential? credential;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool loading = false;

  void validate(
      {required TextEditingController name,
      required TextEditingController email,
      required TextEditingController password,
      required BuildContext context}) async {
    if ((name.text.isEmpty) || (name.text.length <= 4)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Name Field Empty or Short Length')));
      //warning.showToastMessage(context, 'Field Empty or Short Length');
      //warning.showSnackBar(context);
      return;
    } else if ((!email.text.contains('@') || (email.text.trim().isEmpty))) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Empty or Wrong Email')));
      return;
    } else if ((password.text.trim().isEmpty) ||
        (password.text.trim().length <= 5)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Empty Password or Short '
              'length')));
      return;
    } else {
      try {
        loading = true;
        notifyListeners();
        credential = await _auth.createUserWithEmailAndPassword(
            email: email.text, password: password.text);

        loading = true;
        notifyListeners();
        _firestore.collection('user').doc(credential!.user!.uid).set({
          "name": name.text,
          "email": email.text,
          "uid": credential!.user!.uid,
        }).then((value) {
          loading = false;
          notifyListeners();
          goToNext(context: context, screen: HomeScreen());
        });
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Too weak password')));
        }
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  '${credential!.user!.email} is already registered..🤨')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('this ${e.toString()} exception was found.')));
      }
    }
  }
}
