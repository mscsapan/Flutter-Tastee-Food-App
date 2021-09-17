import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final UserCredential? _credential;

  registerWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      _credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _credential;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password is too weak')));
        if (error.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  '${_credential!.user!.email} is already registered.🤨')));
        }
      }
    } catch (e) {
      print('Exception found ${e.toString()}');
    }
  }
}
