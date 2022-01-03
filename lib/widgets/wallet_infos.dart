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
    double _satoshisBitcoins = cart.satoshisBitcoins;
    double _bitcoinPrice = currency.bitcoinPrice;
    double satoshisBitcoinsInDollar = _satoshisBitcoins * _bitcoinPrice;
    double satoshisBitcoinsInBitcoin = _satoshisBitcoins;

    int productPriceBitcoins = int.parse(
        satoshisBitcoinsInBitcoin.toStringAsFixed(8).toString().split(".")[0]);
    int productPriceSatoshis = int.parse(
        satoshisBitcoinsInBitcoin.toStringAsFixed(8).toString().split(".")[1]);

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
                  'Satoshi Nakamoto\'s Bitcoins',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(text: '₿ '),
                      TextSpan(
                        text: '$productPriceBitcoins',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '.$productPriceSatoshis',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(
                //   _isDollar == true
                //       ? '\$${_satoshisBitcoins * _bitcoinPrice}'
                //       : '₿${_satoshisBitcoins.toStringAsFixed(8)}',
                //   style: TextStyle(fontSize: 18),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
