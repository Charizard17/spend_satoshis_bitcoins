import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/spend_screen.dart';
import './screens/home_screen.dart';
import './provider/currencies.dart';
import './provider/cart.dart';
import './provider/products.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Currencies(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = Provider.of<Currencies>(context, listen: true);
    bool _isDollar = currency.isDollar;

    return MaterialApp(
      title: 'Spend Satoshi\'s Money',
      theme: ThemeData(
        primaryColor: _isDollar == false ? Colors.orange : Colors.green,
        accentColor: Colors.green,
        scaffoldBackgroundColor: Colors.grey[200],
        backgroundColor: Colors.white,
        disabledColor: Colors.redAccent,
        fontFamily: 'Revamped',
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SpendScreen.routeName: (ctx) => SpendScreen(),
      },
    );
  }
}
