import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/screens/home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showProgress = false;
  final _auth = FirebaseAuth.instance;

  String email, password;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ModalProgressHUD(
        color: Colors.white,
        inAsyncCall: showProgress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Material(
              color: Color(0xFF1098EC),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(275)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 50, bottom: 10),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'TOKO',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'LINK',
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        //isi email
                        email = value;
                      },
                      decoration: kTextFieldDecoration,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        //isi pass
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Password'),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 20),
                    child: Material(
                      color: Color(0xFF1098EC),
                      elevation: 5,
                      borderRadius: BorderRadius.circular(100),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            showProgress = true;
                          });
                          try {
                            if (email != null &&
                                password != null &&
                                password.length > 5) {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                Navigator.pushNamed(context, Home.id);
                              }
                              setState(() {
                                showProgress = false;
                              });
                            } else {
                              setState(() {
                                showProgress = false;
                              });
                              return await showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    'Alert',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  content: Text(
                                    'Please enter your Email and Password correctly',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: ClipOval(
                          child: Container(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                            height: 75,
                            width: 75,
                          ),
                        ),
                      ), //
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
