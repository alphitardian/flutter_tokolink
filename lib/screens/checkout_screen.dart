import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/components/confirmation_dialog.dart';
import 'package:ftokolink/components/payment_tiles.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/home_screen.dart';
import 'package:ftokolink/utils/cart_data.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  static const String id = 'checkOut';

  final CartData cart;

  const CheckOut({Key key, this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int finalPrice = cart?.calcPrice();

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
                        'Rp $finalPrice',
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
            InkWell(
              onTap: () {
                Provider.of<CartData>(context).clearItem();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog();
                    });
              },
              child: PaymentTiles(
                paymentType: 'LinkPoints',
                paymentDesc: 'Anda berpotensi mendapatkan cashback sebesar 30%',
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<CartData>(context).clearItem();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog();
                    });
              },
              child: PaymentTiles(
                paymentType: 'Cash',
                paymentDesc: 'Bayar langsung ditempat',
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<CartData>(context).clearItem();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog();
                    });
              },
              child: PaymentTiles(
                paymentType: 'Kasbon',
                paymentDesc:
                    'Bayar maksimal 30 hari secara otomatis menggunakan LinkPoints',
              ),
            )
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () {},
//        icon: Icon(
//          Icons.payment,
//          size: 30,
//          color: Colors.white,
//        ),
//        label: Padding(
//          padding: const EdgeInsets.all(10.0),
//          child: Text(
//            'Bayar',
//            style: TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 20,
//            ),
//          ),
//        ),
//      ),
    );
  }
}
