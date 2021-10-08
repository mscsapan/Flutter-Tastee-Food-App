import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_food_application/screens/admin/admin_sign_in_screen.dart';
import 'package:provider/provider.dart';

import 'controller/admin_controller.dart';
import 'controller/image_controller.dart';
import 'controller/login_validate_controller.dart';
import 'controller/profile_update_controller.dart';
import 'controller/registration_validate_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegistrationController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => ProfileUpdateController()),
        ChangeNotifierProvider(create: (context) => UploadImageController()),
        ChangeNotifierProvider(create: (context) => AdminController()),
      ],
      child: MaterialApp(
        /* home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return WelcomeScreen();
            }
          },
        ),*/
        home: AdminSignInScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
