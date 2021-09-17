import 'package:flutter/material.dart';
import 'package:my_food_application/constant/constant.dart';
import 'package:my_food_application/controller/registration_validate_controller.dart';
import 'package:my_food_application/model/categories_model.dart';

class CategoriesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double conSize = 200.0;
    return Container(
      height: conSize,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            Categories cate = categories[index];
            return InkWell(
              onTap: () => warning.showToastMessage(context, '${cate.name}'),
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network('${cate.images}', fit: BoxFit.cover),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('${cate.name}',
                              style: TextStyle(
                                  color: mWhiteApp,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
