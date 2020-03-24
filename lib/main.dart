import 'package:flutter/material.dart';
import 'package:ftokolink/screens/about_screen.dart';
import 'package:ftokolink/screens/cart_screen.dart';
import 'package:ftokolink/screens/checkout_screen.dart';
import 'package:ftokolink/screens/home_screen.dart';
import 'package:ftokolink/screens/itemdetail_screen.dart';
import 'package:ftokolink/screens/login_screen.dart';
import 'package:ftokolink/screens/search_screen.dart';
import 'package:ftokolink/screens/shopdetail_screen.dart';
import 'package:ftokolink/screens/splash_screen.dart';
import 'package:ftokolink/screens/wallet_screen.dart';
import 'package:ftokolink/utils/cart_data.dart';
import 'package:provider/provider.dart';

void main() => runApp(TokoLinkApp());

class TokoLinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => new CartData(),
      child: MaterialApp(
        theme: ThemeData.light(),
        initialRoute: SplashScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          Home.id: (context) => Home(),
          CartScreen.id: (context) => CartScreen(),
          CheckOut.id: (context) => CheckOut(),
          SearchScreen.id: (context) => SearchScreen(),
          DetailScreen.id: (context) => DetailScreen(),
          ShopDetail.id: (context) => ShopDetail(),
          WalletScreen.id: (context) => WalletScreen(),
          AboutScreen.id: (context) => AboutScreen(),
          SplashScreen.id: (context) => SplashScreen(),
        },
      ),
    );
  }
}
