import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_food_application/constant/constant.dart';

class ShowWarning {
  showToastMessage(BuildContext context, String title) {
    showFlash(
        context: context,
        duration: Duration(seconds: 1),
        builder: (context, controller) {
          return Flash.dialog(
              controller: controller,
              borderRadius: BorderRadius.circular(10),
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 50.0),
              backgroundColor: mBlack,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400)),
              ));
        });
  }

  showSnackBar(BuildContext context, String title) {
    return showFlash(
        context: context,
        duration: Duration(seconds: 3),
        builder: (context, controller) {
          return Flash.bar(
            controller: controller,
            backgroundColor: mBlackDark,
            child: FlashBar(
              showProgressIndicator: true,
              content: Text(title, style: TextStyle(color: mWhiteColor)),
            ),
          );
        });
  }
}
