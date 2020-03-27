import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftokolink/constants.dart';
import 'package:ftokolink/models/items.dart';
import 'package:ftokolink/screens/itemdetail_screen.dart';
import 'package:ftokolink/utils/list_item.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'searchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<Item>.from(item);
  var itemSearch = List<Item>();

  @override
  void initState() {
    // TODO: implement initState
    itemSearch.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Item> dummySearchList = List<Item>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<Item> dummyListData = List<Item>();
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        itemSearch.clear();
        itemSearch.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        itemSearch.clear();
        itemSearch.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pencarian',
                  style: TextStyle(
                    color: kTextMainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Cari Barang atau Toko',
                    hintStyle: TextStyle(color: kTextMainColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMainColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kMainColor, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                  autofocus: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Hasil Pencarian',
                  style: TextStyle(color: kTextMainColor, fontSize: 25),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: itemSearch.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                item: itemSearch[index],
                              ),
                            ));
                      },
                      child: ListTile(
                        trailing: Image(
                          image: itemSearch[index].itemImage,
                        ),
                        title: Text(itemSearch[index].name),
                        subtitle: Text(itemSearch[index].itemDesc),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
