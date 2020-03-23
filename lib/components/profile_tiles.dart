import 'package:flutter/material.dart';

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
