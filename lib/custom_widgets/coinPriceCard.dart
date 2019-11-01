import 'package:flutter/material.dart';

class CoinPriceCard extends StatelessWidget {
  final String coinType;
  final String currencyType;
  final String coinInCurrency;

  CoinPriceCard({this.coinType, this.currencyType, this.coinInCurrency});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            '1 $coinType = $coinInCurrency $currencyType',
            //'Coin1',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
