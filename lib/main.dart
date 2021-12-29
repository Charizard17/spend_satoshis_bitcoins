import 'package:flutter/material.dart';

import './screens/spend_screen.dart';

void main() {
  runApp(const MyApp());
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
