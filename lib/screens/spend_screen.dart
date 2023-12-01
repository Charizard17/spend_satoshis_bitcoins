import 'package:flutter/material.dart';

import '../widgets/product_list.dart';
import '../widgets/wallet_infos.dart';
import '../widgets/receipt.dart';
import '../widgets/header.dart';

class SpendScreen extends StatefulWidget {
  static const routeName = '/spend-screen';

  @override
  State<SpendScreen> createState() => _SpendScreenState();
}

class _SpendScreenState extends State<SpendScreen> {
  int _currentIndex = 0;

  final tabs = [
    ProductList(),
    Receipt(),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.grey.withOpacity(0.5),
              ],
            ),
          ),
          child: Column(
            children: [
              Header(),
              WalletInfos(),
              SizedBox(height: 10),
              tabs[_currentIndex],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          iconSize: 22,
          selectedFontSize: 15,
          unselectedFontSize: 13,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_rounded),
              label: 'Receipt',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
