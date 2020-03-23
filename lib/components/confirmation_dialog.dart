import 'package:flutter/material.dart';
import 'package:ftokolink/screens/home_screen.dart';

import '../constants.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Terima Kasih Atas Pembeliannya!',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Kembali Belanja',
            style: TextStyle(color: kMainColor, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pushNamed(context, Home.id);
          },
        )
      ],
    );
  }
}
