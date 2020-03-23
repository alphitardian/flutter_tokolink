import 'package:flutter/material.dart';

import '../constants.dart';

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
