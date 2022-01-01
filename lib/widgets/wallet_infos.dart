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
    final cart = Provider.of<Cart>(context);
    final currency = Provider.of<Currencies>(context, listen: true);
    bool _isDollar = currency.isDollar;
    double _satoshisBitcoins = currency.satoshisBitcoins;
    double _bitcoinPrice = currency.bitcoinPrice;
    double _finalAmount = double.parse(_satoshisBitcoins.toStringAsFixed(8)) -
        double.parse((cart.totalAmount / _bitcoinPrice).toStringAsFixed(8));

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
            backgroundImage: NetworkImage(
                'https://personal-financial.com/wp-content/uploads/2020/06/The-day-the-true-false-Satoshi-Nakamoto-received-102-BTC.jpg'),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Icon(
                //       Icons.info,
                //       color: Colors.orange,
                //     ),
                //   ],
                // ),
                Text(
                  'Satoshi Nakamoto\'s wallet',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _isDollar == true
                    ? Text('\$${_finalAmount * _bitcoinPrice}')
                    : Text('₿${_finalAmount.toStringAsFixed(8)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
