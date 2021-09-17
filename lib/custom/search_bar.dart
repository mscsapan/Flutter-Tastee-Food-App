import 'package:flutter/material.dart';
import 'package:my_food_application/constant/constant.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const SearchBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: mGrey700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: 'Search Your Product..', border: InputBorder.none),
          style: TextStyle(fontSize: 22.0),
        ),
      ),
    );
  }
}
