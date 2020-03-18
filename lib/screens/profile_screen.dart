import 'package:flutter/material.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/login_screen.dart';
import 'package:ftokolink/screens/wallet_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {}))
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 15, right: 15),
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.account_circle,
                    color: kMainColor,
                    size: 100,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ardian Alphita',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text('Common User')
                  ],
                ),
              ],
            ),
            Divider(
              color: kMainColor,
              thickness: 1,
            ),
            ProfileTiles(
              title: 'History',
              onTap: () {
                Navigator.pushNamed(context, WalletScreen.id);
              },
            ),
            ProfileTiles(
              title: 'Pembayaran',
              onTap: () {},
            ),
            ProfileTiles(
              title: 'Setting',
              onTap: () {},
            ),
            ProfileTiles(
              title: 'Log Out',
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  ProfileTiles({this.title, this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
