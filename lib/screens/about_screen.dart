import 'package:flutter/material.dart';
import 'package:ftokolink/constants.dart';

class AboutScreen extends StatelessWidget {
  static const String id = 'aboutScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: kAppBarStyle),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('images/about.png'),
            ),
            Text(
              'About Us',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'TokoLink Project Team',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('672018149\n'
                '672018150\n'
                '672018269\n'
                '672018294\n'),
            Text('All Right Reserved. 2020')
          ],
        ),
      ),
    );
  }
}
