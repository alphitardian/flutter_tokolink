import 'package:flutter/material.dart';
import 'package:ftokolink/components/card_item.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/itemdetail_screen.dart';

class HomeScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView(
          children: <Widget>[
            ListItem(
              title: 'Rekomendasi',
              titleSecond: 'Hari ini',
            ),
            ListItem(
              title: 'Paling',
              titleSecond: 'Banyak Dibeli',
            ),
            ListItem(
              title: 'Rekomendasi',
              titleSecond: 'Toko Lain',
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  ListItem({this.titleSecond, this.title});

  final String title;
  final String titleSecond;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kTextMainColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              widget.titleSecond,
              style: TextStyle(
                fontSize: 20,
                color: kTextMainColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 175,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                //loop cardItem
                CardItem(
                  itemName: 'Beras',
                  image: AssetImage('images/item1.png'),
                  detail: () {
                    Navigator.pushNamed(context, DetailScreen.id);
                  },
                ),
                CardItem(
                  itemName: 'Sosis',
                  image: AssetImage('images/item4.png'),
                  detail: () {
                    Navigator.pushNamed(context, DetailScreen.id);
                  },
                ),
                CardItem(
                  itemName: 'Sabun',
                  image: AssetImage('images/item2.png'),
                  detail: () {
                    Navigator.pushNamed(context, DetailScreen.id);
                  },
                ),
                CardItem(
                  itemName: 'Tisu',
                  image: AssetImage('images/item6.png'),
                  detail: () {
                    Navigator.pushNamed(context, DetailScreen.id);
                  },
                ),
                CardItem(
                  itemName: 'Sampo',
                  image: AssetImage('images/item3.png'),
                  detail: () {
                    Navigator.pushNamed(context, DetailScreen.id);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
