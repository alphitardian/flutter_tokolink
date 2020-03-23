import 'package:flutter/material.dart';
import 'package:ftokolink/components/card_item.dart';

import '../constants.dart';

class ShopDetail extends StatelessWidget {
  static const String id = 'shopDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopName', style: kAppBarStyle),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Center(
                      child: Image(
                        image: AssetImage('images/shop.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Deskripsi',
                    style: TextStyle(color: kTextMainColor, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(
                      color: kTextMainColor,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Daftar Barang',
                    style: TextStyle(color: kTextMainColor, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 9 / 11,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: ScrollPhysics(),
                children: <Widget>[
                  CardItem(
                    itemName: 'Beras',
                    image: AssetImage('images/item1.png'),
                    detail: () {
                      Navigator.pop(context);
                    },
                  ),
                  CardItem(
                    itemName: 'Sosis',
                    image: AssetImage('images/item4.png'),
                    detail: () {
                      Navigator.pop(context);
                    },
                  ),
                  CardItem(
                    itemName: 'Sabun',
                    image: AssetImage('images/item2.png'),
                    detail: () {
                      Navigator.pop(context);
                    },
                  ),
                  CardItem(
                    itemName: 'Sampo',
                    image: AssetImage('images/item3.png'),
                    detail: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
