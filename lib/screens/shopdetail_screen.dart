import 'package:flutter/material.dart';

import '../constants.dart';

class ShopDetail extends StatelessWidget {
  static const String id = 'shopDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ShopName',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
                  GridView.count(crossAxisCount: 2)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
