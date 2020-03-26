import 'package:flutter/material.dart';
import 'package:ftokolink/components/list_item.dart';
import 'package:ftokolink/components/list_shop.dart';

class HomeScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          children: <Widget>[
            ListItem(
              title: 'Rekomendasi',
              titleSecond: 'Hari ini',
            ),
            ListItem(
              title: 'Paling',
              titleSecond: 'Banyak Dibeli',
            ),
            ListItem(
              title: 'Rekomendasi',
              titleSecond: 'Toko Lain',
            ),
            ListShop(
              title: 'Toko',
              titleSecond: 'Paling Populer',
            ),
          ],
        ),
      ),
    );
  }
}
