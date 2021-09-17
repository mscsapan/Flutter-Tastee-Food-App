import 'package:flutter/material.dart';

goToNext({required BuildContext context, required Widget screen}) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen));
}
