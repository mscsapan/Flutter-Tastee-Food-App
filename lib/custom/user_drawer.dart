import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/custom/page_route.dart';
import 'package:my_food_application/screens/authenticate/toggle_screen.dart';
import 'package:my_food_application/screens/home_screen.dart';
import 'package:my_food_application/screens/product_main_screen.dart';
import 'package:my_food_application/screens/profile/profile.dart';

@immutable
class UserDrawer extends StatelessWidget {
  List<String> title = [
    'profile',
    'cart list',
    'favourite',
    'my order',
    'log out'
  ];
  List<IconData> icons = [
    FontAwesomeIcons.user,
    FontAwesomeIcons.shoppingCart,
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.shoppingBasket,
    FontAwesomeIcons.signOutAlt,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: mGreen800),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/non2.jpg')),
              arrowColor: Colors.red,
              accountName: Text(model!.userName),
              accountEmail: Text(model!.userEmail)),
          SizedBox(height: 20.0),
          buildListTile(
              title: title[0],
              icon: icons[0],
              onTap: () => goToNext(context: context, screen: ProfileScreen())),
          buildListTile(title: title[1], icon: icons[1], onTap: () {}),
          buildListTile(
              title: title[2],
              icon: icons[2],
              onTap: () => goToNext(context: context, screen: ProductScreen())),
          buildListTile(title: title[3], icon: icons[3], onTap: () {}),
          buildListTile(
              title: title[4],
              icon: icons[4],
              onTap: () => FirebaseAuth.instance.signOut().then((value) {
                    goToNext(context: context, screen: ToggleScreen());
                  })),
        ],
      ),
    );
  }
}

Widget buildListTile(
    {required String title,
    required IconData icon,
    required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        ListTile(
          title: Text(title.toUpperCase()),
          leading: FaIcon(icon),
        ),
        Divider(thickness: 1.5)
      ],
    ),
  );
}
