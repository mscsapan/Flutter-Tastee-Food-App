import 'package:flutter/material.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/controller/registration_validate_controller.dart';
import 'package:my_food_application/custom/already_account.dart';
import 'package:my_food_application/custom/custom_button.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  final Function register;
  RegistrationScreen({required this.register});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String nameText = 'Your Full Name';
  String emailText = 'Your Email';
  String passwordText = 'Your Password';
  bool obscure = false;
  bool visible = true;
  double conSize = 140.0;

  visibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    RegistrationController validate =
        Provider.of<RegistrationController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration',
            style: TextStyle(color: mBlack, fontSize: 26.0)),
        backgroundColor: mWhiteApp,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: conSize,
                width: conSize,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  radius: conSize,
                  child: ClipOval(
                    child: Image.asset('assets/images/non2.jpg',
                        fit: BoxFit.cover, height: conSize, width: conSize),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: defaultBorder,
                      focusedBorder: defaultBorder,
                      hintText: nameText),
                  style: inputStyle(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: TextFormField(
                    controller: emailController,
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
                          onPressed: () => visibility(),
                          icon: visible
                              ? Icon(Icons.visibility_off, color: mGrey700)
                              : Icon(Icons.visibility, color: mGrey700)),
                    ),
                    obscureText: visible,
                    style: inputStyle()),
              ),
              AlreadyAccount(
                  onTap: () => widget.register(),
                  message: 'Already have an account?',
                  title: 'login'),
              myButton(
                  title: 'Register',
                  onTap: () {
                    validate.validate(
                        context: context,
                        name: nameController,
                        email: emailController,
                        password: passwordController);
                  }),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
