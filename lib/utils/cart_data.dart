import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ftokolink/models/cart.dart';

class CartData extends ChangeNotifier {
  List<Cart> cartItem = [
    Cart('Beras', 'Ukuran 2kg', 56000, AssetImage('images/item1.png'))
  ];

  void addItem(String item, String itemDesc, int price, AssetImage image) {
    final newItem = Cart(item, itemDesc, price, image);
    cartItem.add(newItem);
    print(cartItem);
    notifyListeners();
  }

  void clearItem(List<Cart> cart) {
    cartItem.clear();
    print(cartItem);
    notifyListeners();
  }
}
