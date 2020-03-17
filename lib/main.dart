import 'package:flutter/material.dart';
import 'package:ftokolink/screens/cart_screen.dart';
import 'package:ftokolink/screens/checkout_screen.dart';
import 'package:ftokolink/screens/home_screen.dart';
import 'package:ftokolink/screens/itemdetail_screen.dart';
import 'package:ftokolink/screens/login_screen.dart';
import 'package:ftokolink/screens/search_screen.dart';
import 'package:ftokolink/screens/shopdetail_screen.dart';

void main() => runApp(TokoLinkApp());

class TokoLinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        Home.id: (context) => Home(),
        CartScreen.id: (context) => CartScreen(),
        CheckOut.id: (context) => CheckOut(),
        SearchScreen.id: (context) => SearchScreen(),
        DetailScreen.id: (context) => DetailScreen(),
        ShopDetail.id: (context) => ShopDetail(),
      },
    );
  }
}