import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.red)
      ),
      child: Center(
        child: Text('Advertisement'),
      ),
    );
  }
}
