import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/spend_screen.dart';
import 'provider/currencies.dart';
import './provider/cart.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: SpendScreen(),
    );
  }
}
