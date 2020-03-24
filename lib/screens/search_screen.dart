import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/components/item_tiles.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/shopdetail_screen.dart';

class SearchScreen extends StatelessWidget {
  static const String id = 'searchScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pencarian',
                  style: TextStyle(
                    color: kTextMainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Cari Barang atau Toko',
                    hintStyle: TextStyle(color: kTextMainColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMainColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMainColor, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                  autofocus: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Hasil Pencarian',
                  style: TextStyle(color: kTextMainColor, fontSize: 25),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, ShopDetail.id);
                              },
                              child: Text(
                                'Toko Mbok Darmi',
                                style: TextStyle(
                                    color: kTextMainColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ItemTiles(
                              image: AssetImage('images/item1.png'),
                              itemPrice: 56000,
                              itemName: 'Beras KW1',
                              itemDescription: 'Ukuran 2KG',
                            ),
                            ItemTiles(
                              image: AssetImage('images/item1.png'),
                              itemPrice: 54000,
                              itemName: 'Beras KW2',
                              itemDescription: 'Ukuran 2KG',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
