import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

import '../provider/currencies.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final currency = Provider.of<Currencies>(context, listen: true);
    double _bitcoinPrice = currency.bitcoinPrice;

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            label: Text(
              '₿ 1 = \$ ${_bitcoinPrice.toStringAsFixed(0)}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).primaryColor,
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
              activeColor: Theme.of(context).accentColor,
              inactiveTrackColor:
                  Theme.of(context).primaryColor.withOpacity(0.6),
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
