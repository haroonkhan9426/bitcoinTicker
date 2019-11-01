import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/data/coin-data.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker/custom_widgets/coinPriceCard.dart';
import 'package:bitcoin_ticker/services/network.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCurrency = currenciesList.first;
  String selectedCoin = cryptoList.first;
  String selectedPrice = '?';

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
            CoinPriceCard(
                currencyType: selectedCurrency,
                coinType: selectedCoin,
                coinInCurrency: selectedPrice),
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
        selectedCurrency = currenciesList[val];
      },
      children: currenciesList.map((currency) => Text(currency)).toList(),
    );
  }

  DropdownButton getAndroidDropdown() {
    return DropdownButton(
      value: selectedCurrency,
      onChanged: (newVal) async {
        String url = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/$selectedCoin$selectedCurrency';
        String price = await NetworkHelper(url: url).getDataPrice();

        setState(() {
          selectedCurrency = newVal;
          selectedPrice = price;
        });
      },
      items: currenciesList
          .map((currency) =>
              DropdownMenuItem(value: currency, child: Text(currency)))
          .toList(),
    );
  }

  void updatePrice(String currency) async {

  }
}
