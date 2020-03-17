import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/shopdetail_screen.dart';

class DetailScreen extends StatelessWidget {
  static const String id = 'detailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ItemName',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image(
                      image: AssetImage('images/item1.png'),
                      fit: BoxFit.contain,
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
                    height: 20,
                  ),
                  Text(
                    'Barang Terdapat di',
                    style: TextStyle(fontSize: 25, color: kTextMainColor),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ShopDetail.id);
              },
              child: DetailTiles(
                shop: 'Toko Mbak Dar',
                range: '0.5 KM',
                price: '56000',
              ),
            ),
            GestureDetector(
              child: DetailTiles(
                shop: 'Toko Wira Ekonomi',
                range: '0.6 KM',
                price: '55000',
              ),
            ),
            GestureDetector(
              child: DetailTiles(
                shop: 'Toko Kelontong A',
                range: '0.8 KM',
                price: '57200',
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
