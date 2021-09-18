import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/screens/home_screen.dart';

class LoginController extends ChangeNotifier {
  UserCredential? credential;
  bool loading = false;


  void loginController(
    BuildContext context,
    TextEditingController email,
    TextEditingController password,
  ) async {
    if (email.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Email Field is Empty')));
      return;
    }
    if (password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password Field can\'t be is Empty')));
      return;
    } else {
      try {
        loading = true;
        notifyListeners();
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) {
          loading = false;
          notifyListeners();
          goToNext(context: context, screen: HomeScreen());
        });
        notifyListeners();
      } on FirebaseException catch (e) {
        loading = false;
        notifyListeners();
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('No user found for that email.😪')));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Wrong password provided for that user.😕')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('This ${e.toString()} Exception found.')));
      }
    }
  }
}
