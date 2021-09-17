import 'package:flutter/material.dart';

goToNext({required BuildContext context, required Widget screen}) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}
