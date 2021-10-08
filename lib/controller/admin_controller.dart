import 'package:flutter/material.dart';
import 'package:my_food_application/controller/registration_validate_controller.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/screens/home_screen.dart';

class AdminController extends ChangeNotifier {
  bool visible = true;
  final String id = 'SA1001';
  final String name = 'Sapan';
  final String pass = 'admin1234';

  void visibility() {
    visible = !visible;
    notifyListeners();
  }

  void validateField(BuildContext context, String name, String password) {
    if (name.isEmpty) {
      warning.showSnackBar(context, 'Name Field is empty');
      return;
    }
    if ((password.isEmpty) || (password.length < 5)) {
      warning.showSnackBar(context, 'Empty or Short Length');
      return;
    }
    if ((name.contains(name) || name.contains(id)) && password.contains(pass)) {
      goToNext(context: context, screen: HomeScreen());
    }
  }
}
