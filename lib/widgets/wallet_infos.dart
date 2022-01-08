import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/currencies.dart';
import '../provider/cart.dart';

class WalletInfos extends StatefulWidget {
  @override
  State<WalletInfos> createState() => _WalletInfosState();
}

class _WalletInfosState extends State<WalletInfos> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final currency = Provider.of<Currencies>(context, listen: true);
    bool _isDollar = currency.isDollar;
    double _satoshisBitcoins = cart.satoshisBitcoins;
    double _bitcoinPrice = currency.bitcoinPrice;
    final dollarFormat = currency.dollarFormat;
    final bitcoinFormat = currency.bitcoinFormat;

    return Container(
      width: 350,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border.all(width: 2, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
              radius: 40,
              backgroundColor: Theme.of(context).primaryColor,
              backgroundImage: AssetImage('assets/images/satoshi-nakamoto-reverse.png'),
            ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Satoshi Nakamoto\'s',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Revamped',
                  ),
                ),
                Text(
                  'Bitcoins',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Revamped',
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  _isDollar == true
                      ? '\$ ${dollarFormat.format(_satoshisBitcoins * _bitcoinPrice)}'
                      : '₿ ${bitcoinFormat.format(_satoshisBitcoins)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
