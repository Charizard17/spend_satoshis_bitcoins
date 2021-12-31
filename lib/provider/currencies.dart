import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Currencies with ChangeNotifier {
  var isDollar = false;
  double _satoshisBitcoins = 1125150;
  double _bitcoinPrice = 47500;

  double get satoshisBitcoins => _satoshisBitcoins;
  double get bitcoinPrice => _bitcoinPrice;

  void changeCurrency() {
    if (isDollar == false) {
      isDollar = true;
    } else {
      isDollar = false;
    }
    notifyListeners();
  }
}
