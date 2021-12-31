import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/currencies.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currency = Provider.of<Currencies>(context, listen: true);

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
            leading: Icon(Icons.attach_money),
            title: Text('Change currency ₿ <=> \$'),
            onTap: currency.changeCurrency,
          ),
        ],
      ),
    );
  }
}
