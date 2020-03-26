import 'package:flutter/material.dart';
import 'package:ftokolink/screens/shopdetail_screen.dart';
import 'package:ftokolink/utils/list_shop.dart';

import '../constants.dart';
import 'card_item.dart';

class ListShop extends StatefulWidget {
  ListShop({this.titleSecond, this.title});

  final String title;
  final String titleSecond;

  @override
  _ListShopState createState() => _ListShopState();
}

class _ListShopState extends State<ListShop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kTextMainColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              widget.titleSecond,
              style: TextStyle(
                fontSize: 20,
                color: kTextMainColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shop.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShopDetail(
                                    shop: shop[index],
                                  )));
                    },
                    child: CardItem(
                      itemName: shop[index].name,
                      image: shop[index].image,
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
