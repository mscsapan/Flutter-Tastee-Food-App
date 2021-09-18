import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/custom/categories_item.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/custom/popular_product.dart';
import 'package:my_food_application/custom/search_bar.dart';
import 'package:my_food_application/custom/single_product.dart';
import 'package:my_food_application/custom/user_drawer.dart';
import 'package:my_food_application/model/user_model.dart';
import 'package:my_food_application/screens/authenticate/toggle_screen.dart';

late UserModel model;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double conSize = 190.0;

  sizedBox() => SizedBox(height: 10.0);
  TextEditingController searchController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future getUserInformation() async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        model = UserModel.fromDatabase(snapshot);
      } else {
        print('No record found...');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInformation();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
                onPressed: () => FirebaseAuth.instance.signOut().then((value) {
                      goToNext(context: context, screen: ToggleScreen());
                    }),
                icon: Icon(Icons.exit_to_app))
          ],
          automaticallyImplyLeading: true,
          backgroundColor: mOrange,
          elevation: 0.0,
          centerTitle: true,
          toolbarHeight: 60.0,
        ),
        drawer: UserDrawer(),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SearchBar(controller: searchController),
              sizedBox(),
              titleText(title: 'Categories'),
              sizedBox(),
              CategoriesItem(),
              sizedBox(),
              titleText(title: 'Product'),
              sizedBox(),
              SingleProduct(),
              sizedBox(),
              titleText(title: 'Popular Product'),
              sizedBox(),
              PopularProduct(),
            ],
          ),
        ));
  }
}
