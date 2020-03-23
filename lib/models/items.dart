import 'package:flutter/widgets.dart';
import 'package:ftokolink/models/shop.dart';

class Item {
  final String name;
  final String itemDesc;
  final int price;
  final AssetImage itemImage;
  final Shop shop;

  Item({this.name, this.itemDesc, this.price, this.itemImage, this.shop});
}
