import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/components/item_tiles.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/checkout_screen.dart';
import 'package:ftokolink/screens/search_screen.dart';
import 'package:ftokolink/utils/cart_data.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

const List<String> delivery = [
  'GO-SEND',
  'GRAB-SEND',
  'JEGGBOY',
];

class CartScreen extends StatefulWidget {
  static const String id = 'cartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

enum Choice { COD, Delivery }

class _CartScreenState extends State<CartScreen> {
  String selectedItem = 'GO-SEND';

  DropdownButton androidDropDown() {
    List<DropdownMenuItem<String>> dropdownItem = [];

    for (String item in delivery) {
      var newItem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      dropdownItem.add(newItem);
    }

    return DropdownButton(
      value: selectedItem,
      items: dropdownItem,
      onChanged: (value) {
        setState(() {
          selectedItem = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Home.id);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              //ke halaman search
                              Navigator.pushNamed(context, SearchScreen.id);
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Home.id);
                            },
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.grey,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Keranjang Saya',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: kTextMainColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Consumer<CartData>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    itemCount: cart.cartItem.length,
                    itemBuilder: (context, index) {
                      return ItemTiles(
                        itemName: cart.cartItem[index].name,
                        image: cart.cartItem[index].image,
                        itemDescription: cart.cartItem[index].itemDesc,
                        itemPrice: cart.cartItem[index].price,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        label: Text(
          'Check Out',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          return _asyncSimpleDialog(context);
        },
        backgroundColor: kMainColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Future<Choice> _asyncSimpleDialog(BuildContext context) async {
    return await showDialog<Choice>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            title: const Text(
              'Pilih Salah Satu',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: kTextMainColor),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
//                  Navigator.pop(context, Choice.COD);
                  Navigator.pushNamed(context, CheckOut.id);
                  print(Choice.COD);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ambil di Tempat',
                      style: TextStyle(
                        color: kTextMainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tunjukkan ORDER ID pada penjual',
                      style: TextStyle(
                        color: kTextMainColor,
                      ),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
//                  Navigator.pop(context, Choice.Delivery);
//                  print(Choice.Delivery);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Delivery',
                      style: TextStyle(
                        color: kTextMainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Pilih layanan berikut ini',
                      style: TextStyle(
                        color: kTextMainColor,
                      ),
                    ),
                    androidDropDown(),
                  ],
                ),
              ),
              Consumer<CartData>(
                builder: (context, cart, child) {
                  return SimpleDialogOption(
                    onPressed: () {
                      //ke halaman cekout
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOut(
                              cart: cart.cartItem,
                            ),
                          ));
                      print(Choice.Delivery);
                    },
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: kMainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          );
        });
  }
}
