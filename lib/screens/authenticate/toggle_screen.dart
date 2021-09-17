import 'package:flutter/material.dart';
import 'package:my_food_application/screens/authenticate/login_screen.dart';
import 'package:my_food_application/screens/authenticate/signin_screen.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  _ToggleScreenState createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  bool isToggle = true;

  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToggle) {
      return LoginScreen(login: toggleScreen);
    } else {
      return RegistrationScreen(register: toggleScreen);
    }
  }
}
