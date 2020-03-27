import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/components/card_grid_item.dart';
import 'package:ftokolink/models/shop.dart';
import 'package:ftokolink/utils/cart_data.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ShopDetail extends StatelessWidget {
  static const String id = 'shopDetail';

  final Shop shop;

  const ShopDetail({Key key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name, style: kAppBarStyle),
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
                childAspectRatio: 9 / 12,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: ScrollPhysics(),
                children: List.generate(shop.item.length, (index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Ditambahkan ke Keranjang!'),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Provider.of<CartData>(context).addItem(
                                        shop.item[index].name,
                                        shop.item[index].itemDesc,
                                        shop.item[index].price,
                                        shop.item[index].itemImage);
                                    print(CartData().cartItem);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Kembali Belanja',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                )
                              ],
                            );
                          });
                    },
                    child: CardGridItem(
                      itemName: shop.item[index].name,
                      image: shop.item[index].itemImage,
                      price: shop.item[index].price,
                    ),
                  );
                }),
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
