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
  String selectedCoin = cryptoList[0];
  String selectedPrice = '?';

  String selectedCurrency1 = currenciesList.first;
  String selectedCoin1 = cryptoList[1];
  String selectedPrice1 = '?';

  String selectedCurrency2 = currenciesList.first;
  String selectedCoin2 = cryptoList[2];
  String selectedPrice2 = '?';

  @override
  Widget build(BuildContext context) {
    print(selectedCoin);
    print(selectedCoin1);
    print(selectedCoin2);
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
            CoinPriceCard(
                currencyType: selectedCurrency1,
                coinType: selectedCoin1,
                coinInCurrency: selectedPrice1),
            CoinPriceCard(
                currencyType: selectedCurrency2,
                coinType: selectedCoin2,
                coinInCurrency: selectedPrice2),
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

        String url1 = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/$selectedCoin1$selectedCurrency1';
        String price1 = await NetworkHelper(url: url1).getDataPrice();

        String url2 = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/$selectedCoin2$selectedCurrency2';
        String price2 = await NetworkHelper(url: url2).getDataPrice();
        setState(() {
          selectedCurrency = newVal;
          selectedPrice = price;
          selectedCurrency1 = newVal;
          selectedPrice1 = price1;
          selectedCurrency2 = newVal;
          selectedPrice2 = price2;
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
