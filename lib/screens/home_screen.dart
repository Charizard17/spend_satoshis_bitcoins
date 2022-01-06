import 'package:flutter/material.dart';

import './spend_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Go to spend screen..'),
          onPressed: () {
            Navigator.of(context).pushNamed(SpendScreen.routeName);
          },
        ),
      ),
    );
  }
}
