import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/spend_screen.dart';
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
    return MaterialApp(
      title: 'Spend Satoshi\'s Money',
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey[200],
        backgroundColor: Colors.white,
        disabledColor: Colors.redAccent,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.red),
        ),
      ),
      home: SpendScreen(),
    );
  }
}
