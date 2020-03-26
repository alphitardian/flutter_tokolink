import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/components/profile_tiles.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/about_screen.dart';
import 'package:ftokolink/screens/login_screen.dart';
import 'package:ftokolink/screens/wallet_screen.dart';

class ProfileScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: kAppBarStyle),
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
              title: 'About',
              onTap: () {
                Navigator.pushNamed(context, AboutScreen.id);
              },
            ),
            ProfileTiles(
              title: 'Log Out',
              onTap: () {
                _auth.signOut();
                Navigator.pushNamed(context, LoginScreen.id);
                print(_auth.signOut());
              },
            ),
          ],
        ),
      ),
    );
  }
}
