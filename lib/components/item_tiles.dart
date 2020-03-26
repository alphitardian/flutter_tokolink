import 'package:flutter/material.dart';

import '../constants.dart';

class ItemTiles extends StatelessWidget {
  ItemTiles({
    this.itemName,
    this.image,
    this.itemDescription,
    this.itemPrice,
  });

  final String itemName;
  final String itemDescription;
  final int itemPrice;
  final AssetImage image;
//  int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: image,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    itemName,
                    style: TextStyle(
                      fontSize: 20,
                      color: kTextMainColor,
                    ),
                  ),
                  Text(
                    itemDescription,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    'Rp ${itemPrice.toString()}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kTextMainColor,
                    ),
                  ),
                ],
              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    GestureDetector(
//                      child: Icon(
//                        Icons.remove,
//                        color: kMainColor,
//                      ),
//                      onTap: () {
//                        setState(() {
//                          widget.count--;
//                        });
//                      },
//                    ),
//                    SizedBox(
//                      width: 5,
//                    ),
//                    Text(
//                      widget.count.toString(),
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        color: kTextMainColor,
//                        fontSize: 18,
//                      ),
//                    ),
//                    SizedBox(
//                      width: 5,
//                    ),
//                    GestureDetector(
//                      child: Icon(
//                        Icons.add,
//                        color: kMainColor,
//                      ),
//                      onTap: () {
//                        setState(() {
//                          widget.count++;
//                        });
//                      },
//                    )
//                  ],
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
