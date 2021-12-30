import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/wallet_info_provider.dart';

class WalletInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _satoshisBitcoins =
        Provider.of<WalletInfoProvider>(context).satoshisBitcoins;
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
                Text('₿$_satoshisBitcoins'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
