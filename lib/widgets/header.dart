import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/currencies.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final currency = Provider.of<Currencies>(context, listen: true);
    double _bitcoinPrice = currency.bitcoinPrice;
    final dollarFormatApi = currency.dollarFormatApi;

    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            label: Text(
              '₿ 1 = \$ ${dollarFormatApi.format(_bitcoinPrice)}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
            onPressed: currency.getLatestPrice,
          ),
          customSwitch(),
        ],
      ),
    );
  }

  Widget customSwitch() => Transform.scale(
        scale: 1.5,
        child: SizedBox(
          width: 75,
          child: GestureDetector(
            child: Switch(
              activeColor: Theme.of(context).colorScheme.secondary,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.6),
              activeThumbImage: AssetImage('assets/images/dollar.png'),
              inactiveThumbImage: AssetImage('assets/images/bitcoin.png'),
              value: Provider.of<Currencies>(context, listen: false).isDollar,
              onChanged: (_) {
                Provider.of<Currencies>(context, listen: false)
                    .changeCurrency();
              },
            ),
          ),
        ),
      );
}
