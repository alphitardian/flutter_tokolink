import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/home_screen.dart';

class CheckOut extends StatelessWidget {
  static const String id = 'checkOut';
  String totalPrice = '56.000';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Home.id);
                          },
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Pembayaran',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Rp $totalPrice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
            PaymentTiles(
              paymentType: 'LinkPoints',
              paymentDesc: 'Anda berpotensi mendapatkan cashback sebesar 30%',
            ),
            PaymentTiles(
              paymentType: 'Cash',
              paymentDesc: 'Bayar langsung ditempat',
            ),
            PaymentTiles(
              paymentType: 'Kasbon',
              paymentDesc:
                  'Bayar maksimal 30 hari secara otomatis menggunakan LinkPoints',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(
          Icons.payment,
          size: 30,
          color: Colors.white,
        ),
        label: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Bayar',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentTiles extends StatelessWidget {
  PaymentTiles({this.paymentDesc, this.paymentType});

  final String paymentType;
  final String paymentDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          height: 75,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                paymentType,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kTextMainColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                paymentDesc,
                style: TextStyle(
                  color: kTextMainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
