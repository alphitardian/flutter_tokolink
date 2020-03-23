import 'package:flutter/material.dart';
import 'package:ftokolink/components/card_item.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/screens/itemdetail_screen.dart';
import 'package:ftokolink/utils/list_item.dart';

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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    item: item[index],
                                  )));
                    },
                    child: CardItem(
                      itemName: item[index].name,
                      image: item[index].itemImage,
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
