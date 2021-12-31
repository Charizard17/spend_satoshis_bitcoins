import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

import '../provider/currencies.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currency = Provider.of<Currencies>(context, listen: true);
    bool _isDollar = currency.isDollar;

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Settings'),
            backgroundColor: Colors.orange,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.refresh),
            title: Text('Get latest price'),
            onTap: () {},
          ),
          ListTile(
            leading: _isDollar == true
                ? Icon(Icons.attach_money)
                : Icon(CryptoFontIcons.BTC),
            title: _isDollar == true
                ? Text('Change currency \$ ⇆ ₿')
                : Text('Change currency ₿ ⇆ \$'),
            onTap: currency.changeCurrency,
          ),
        ],
      ),
    );
  }
}
