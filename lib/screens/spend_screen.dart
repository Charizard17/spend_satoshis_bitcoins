import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_list.dart';
import '../widgets/settings.dart';
import '../provider/currencies.dart';
import '../widgets/wallet_infos.dart';
import '../widgets/ads.dart';

class SpendScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final currency = Provider.of<Currencies>(context, listen: true);
    double _bitcoinPrice = currency.bitcoinPrice;
    bool _isDollar = currency.isDollar;

    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Settings(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          right: 10,
          bottom: 20,
          left: 10,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('₿1 = \$$_bitcoinPrice'),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
            WalletInfos(),
            Divider(
              thickness: 1,
              color: Colors.orange,
            ),
            ProductList(),
            Ads(),
          ],
        ),
      ),
    );
  }
}
