import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/components/home_screen_list.dart';
import 'package:ftokolink/screens/cart_screen.dart';
import 'package:ftokolink/screens/profile_screen.dart';
import 'package:ftokolink/screens/search_screen.dart';
import 'package:ftokolink/screens/wallet_screen.dart';
import 'package:ftokolink/utils/cart_data.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class Home extends StatefulWidget {
  static const String id = 'homeScreen';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _childrens = [HomeScreen(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childrens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        selectedItemColor: kMainColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class HomeScreen extends StatefulWidget {
  final CartData cart;

  const HomeScreen({Key key, this.cart}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedinUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  int currentBalance = 300000;

  @override
  Widget build(BuildContext context) {
    var finalBalance;

    if (finalBalance == null) {
      finalBalance = currentBalance;
    } else {
      finalBalance = widget.cart?.walletUpdate();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 50, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, WalletScreen.id);
                          },
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: <Widget>[
                            Consumer<CartData>(
                              builder: (context, cart, child) {
                                return Text(
                                  'Rp. ${cart.walletUpdate()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                );
                              },
                            )
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, WalletScreen.id);
                          },
                          child: Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hai, Selamat Datang!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SearchScreen.id);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: kTextMainColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Cari Barang atau Toko',
                              style: TextStyle(color: kTextMainColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
            ),
            HomeScreenLayout(),
          ],
        ),
      ),
    );
  }
}
