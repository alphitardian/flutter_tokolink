import 'package:flutter/material.dart';
import 'package:ftokolink/constants.dart';

class WalletScreen extends StatelessWidget {
  static const String id = 'walletScreen';

  @override
  Widget build(BuildContext context) {
    int wallet = 300000;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet', style: kAppBarStyle),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Material(
                elevation: 5,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: kMainColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Rp. ${wallet.toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(
                                Icons.system_update_alt,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Top-Up',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(
                                Icons.view_compact,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'QR-Code',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Transaction History',
              style: TextStyle(
                color: kTextMainColor,
                fontSize: 20,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.compare_arrows,
                color: kMainColor,
                size: 30,
              ),
              title: Text(
                'Warung Mak Siti',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kTextMainColor,
                ),
              ),
              subtitle: Text(
                'ID000001',
                style: TextStyle(color: kTextMainColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.compare_arrows,
                color: kMainColor,
                size: 30,
              ),
              title: Text(
                'Warung Mak Slamet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kTextMainColor,
                ),
              ),
              subtitle: Text(
                'ID000002',
                style: TextStyle(color: kTextMainColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.compare_arrows,
                color: kMainColor,
                size: 30,
              ),
              title: Text(
                'Warung Kelontong A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kTextMainColor,
                ),
              ),
              subtitle: Text(
                'ID000003',
                style: TextStyle(color: kTextMainColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.compare_arrows,
                color: kMainColor,
                size: 30,
              ),
              title: Text(
                'Warung Kelontong B',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kTextMainColor,
                ),
              ),
              subtitle: Text(
                'ID000004',
                style: TextStyle(color: kTextMainColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.compare_arrows,
                color: kMainColor,
                size: 30,
              ),
              title: Text(
                'Warung Kelontong C',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kTextMainColor,
                ),
              ),
              subtitle: Text(
                'ID000005',
                style: TextStyle(color: kTextMainColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.compare_arrows,
                color: kMainColor,
                size: 30,
              ),
              title: Text(
                'Warung Kelontong D',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kTextMainColor,
                ),
              ),
              subtitle: Text(
                'ID000006',
                style: TextStyle(color: kTextMainColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
