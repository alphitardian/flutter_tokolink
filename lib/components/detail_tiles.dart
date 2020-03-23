import 'package:flutter/material.dart';

import '../constants.dart';

class DetailTiles extends StatelessWidget {
  DetailTiles({this.range, this.shop, this.price});

  final String price;
  final String shop;
  final String range;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                shop,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextMainColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                range,
                style: TextStyle(color: kTextMainColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Rp. $price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: kMainColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
