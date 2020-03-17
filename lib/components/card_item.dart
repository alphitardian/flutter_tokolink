import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  CardItem({@required this.itemName, this.detail, this.image});

  final String itemName;
  final Function detail;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: detail,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          elevation: 5,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 150,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  itemName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF707070),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image(
                  image: image,
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
