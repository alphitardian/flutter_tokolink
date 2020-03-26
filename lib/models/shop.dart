import 'package:flutter/material.dart';
import 'package:ftokolink/models/items.dart';

class Shop {
  final String name;
  final String range;
  final AssetImage image;
  final List<Item> item;

  Shop(this.name, this.range, this.item, this.image);
}
