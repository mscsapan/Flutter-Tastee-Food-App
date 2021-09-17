import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  String image =
      'https://cdn.pixabay.com/photo/2017/09/26/13/31/apple-2788616_1280.jpg';
  @override
  Widget build(BuildContext context) {
    double conSize = 270.0;
    return Container(
      height: conSize,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.0),
                height: conSize * 0.8,
                width: conSize - 60.0,
                /*decoration: BoxDecoration(
                    // color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(12.0)),*/
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    height: 240,
                  ),
                ),
              ),
              Text('Apple',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(height: 3.0),
              Text('\$4.6',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
            ],
          );
        },
      ),
    );
  }
}
