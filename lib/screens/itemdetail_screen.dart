import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/components/detail_tiles.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/models/items.dart';
import 'package:ftokolink/screens/shopdetail_screen.dart';
import 'package:ftokolink/utils/list_shop.dart';

class DetailScreen extends StatelessWidget {
  static const String id = 'detailScreen';

  final Item item;

  const DetailScreen({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${item.name}', style: kAppBarStyle),
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
                      image: item.itemImage,
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
            Container(
              child: ListView.builder(
                itemCount: shop.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopDetail(
                              shop: shop[index],
                            ),
                          ));
                    },
                    child: DetailTiles(
                      shop: shop[index].name,
                      range: shop[index].range,
                    ),
                  );
                },
                shrinkWrap: true,
                physics: ScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
