import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/currencies.dart';
import '../provider/cart.dart';

class WalletInfos extends StatefulWidget {
  @override
  State<WalletInfos> createState() => _WalletInfosState();
}

class _WalletInfosState extends State<WalletInfos> {
  @override
  Widget build(BuildContext context) {
    double _satoshisBitcoins =
        Provider.of<Currencies>(context).satoshisBitcoins;
    double _bitcoinPrice =
        Provider.of<Currencies>(context).bitcoinPrice;
    final cart = Provider.of<Cart>(context);

    double _finalAmount =
        double.parse(_satoshisBitcoins.toStringAsFixed(8)) - double.parse((cart.totalAmount/_bitcoinPrice).toStringAsFixed(8));

    return Container(
      width: 300,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orange),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.orange,
            backgroundImage: NetworkImage(
                'https://personal-financial.com/wp-content/uploads/2020/06/The-day-the-true-false-Satoshi-Nakamoto-received-102-BTC.jpg'),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.orange,
                    ),
                  ],
                ),
                Text('Satoshi Nakamoto'),
                Text('₿$_finalAmount'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
