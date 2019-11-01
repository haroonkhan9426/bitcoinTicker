import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/data/coin-data.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropDownVal = currenciesList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin Ticker'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Card1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              color: Colors.lightBlue,
              child:
                  Platform.isAndroid ? getAndroidDropdown() : getIosDropdown(),
            ),
          ],
        ),
      ),
    );
  }

  CupertinoPicker getIosDropdown() {
    return CupertinoPicker(
      itemExtent: 30.0,
      onSelectedItemChanged: (val) {
        dropDownVal = currenciesList[val];
      },
      children: currenciesList.map((currency) => Text(currency)).toList(),
    );
  }

  DropdownButton getAndroidDropdown() {
    return DropdownButton(
      value: dropDownVal,
      onChanged: (newVal) {
        setState(() {
          dropDownVal = newVal;
        });
      },
      items: currenciesList
          .map((currency) =>
              DropdownMenuItem(value: currency, child: Text(currency)))
          .toList(),
    );
  }
}
