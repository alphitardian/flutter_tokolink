import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ftokolink/constants.dart';

class CardGridItem extends StatelessWidget {
  CardGridItem({@required this.itemName, this.image, this.price});

  final String itemName;
  final AssetImage image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 200,
          width: 100,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    itemName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF707070),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: image,
                    fit: BoxFit.scaleDown,
                  )
                ],
              ),
              Container(
                color: Colors.white70,
                child: Text(
                  'Rp. ${price.toString()}',
                  style: TextStyle(
                    color: kTextMainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
