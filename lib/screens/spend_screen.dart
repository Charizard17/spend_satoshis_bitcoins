import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_list.dart';
import '../provider/currencies.dart';
import '../widgets/wallet_infos.dart';
import '../widgets/recipe.dart';

class SpendScreen extends StatefulWidget {
  @override
  State<SpendScreen> createState() => _SpendScreenState();
}

class _SpendScreenState extends State<SpendScreen> {
  int _currentIndex = 0;

  final tabs = [
    ProductList(),
    Recipe(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final currency = Provider.of<Currencies>(context, listen: true);
    double _bitcoinPrice = currency.bitcoinPrice;
    bool _isDollar = currency.isDollar;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
          right: 10,
          bottom: 20,
          left: 10,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            WalletInfos(),
            SizedBox(height: 10),
            tabs[_currentIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 25,
        selectedFontSize: 16,
        unselectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded),
            label: 'Recipe',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
