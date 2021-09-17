import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/custom/custom_button.dart';

class ForgetPassword extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  resetPassword(BuildContext context, String email) async {
    if ((email.isEmpty) || (!email.contains('@'))) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Empty Field or Wrong email')),
      );
    } else {
      try {
        return await _auth.sendPasswordResetEmail(email: email).whenComplete(
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please check $email for reset')),
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final forgetController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Your Password', style: TextStyle(color: mBlack)),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            splashColor: Colors.transparent,
            child: Icon(Icons.arrow_back, color: mBlack)),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: forgetController,
                decoration: InputDecoration(
                    border: defaultBorder,
                    focusedBorder: defaultBorder,
                    hintStyle: inputStyle(),
                    hintText: 'Enter your registered email'),
                style: inputStyle(),
              ),
              SizedBox(height: 20.0),
              myButton(
                  onTap: () => resetPassword(context, forgetController.text),
                  title: 'Reset Password'),
            ],
          ),
        ),
      ),
    );
  }
}
