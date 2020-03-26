import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ftokolink/models/cart.dart';

class CartData extends ChangeNotifier {
  List<Cart> cartItem = [];

  void addItem(String item, String itemDesc, int price, AssetImage image) {
    final newItem = Cart(item, itemDesc, price, image);
    cartItem.add(newItem);
    print(cartItem);
    notifyListeners();
  }

  void clearItem() {
    cartItem.clear();
    print(cartItem);
    notifyListeners();
  }

  int calcPrice() {
    int totalPrice = 0;

    for (int i = 0; i < cartItem.length; i++) {
      totalPrice += cartItem[i].price;
    }
    return totalPrice;
  }

  int walletUpdate() {
    int currentBalance = 300000;

    int finalBalance = currentBalance - calcPrice();

    return finalBalance;
  }

  void deleteItem(Cart value) {
    cartItem.remove(value);
    notifyListeners();
  }
}
