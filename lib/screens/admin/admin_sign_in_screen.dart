import 'package:flutter/material.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/controller/admin_controller.dart';
import 'package:provider/provider.dart';

class AdminSignInScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String emailText = 'admin id';
  String passwordText = 'admin Password';

  @override
  Widget build(BuildContext context) {
    AdminController adminController =
        Provider.of<AdminController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('Admin SignIn')),
      body: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: defaultBorder,
                        focusedBorder: defaultBorder,
                        hintText: emailText),
                    style: inputStyle()),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: defaultBorder,
                      focusedBorder: defaultBorder,
                      hintText: passwordText,
                      suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () => adminController.visibility(),
                          icon: adminController.visible == true
                              ? Icon(Icons.visibility_off, color: mGrey700)
                              : Icon(Icons.visibility, color: mGrey700)),
                    ),
                    obscureText: adminController.visible,
                    style: inputStyle()),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 25.0,
                height: 45.0,
                child: MaterialButton(
                  onPressed: () {
                    adminController.validateField(
                        context, nameController.text, passwordController.text);
                  },
                  child: Text('Admin Sign In',
                      style: TextStyle(color: mWhite, fontSize: 20.0)),
                  color: mOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
