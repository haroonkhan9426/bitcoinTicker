import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin Ticker'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              child: Text('Card1'),
            ),
            Card(
              child: Text('Card1'),
            ),
            Card(
              child: Text('Card1'),
            ),

          ],
        ),

      ),
    );
  }
}
