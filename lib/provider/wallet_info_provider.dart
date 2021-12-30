import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletInfoProvider with ChangeNotifier {
  double _satoshisBitcoins = 1125150;
  int _bitcoinPrice = 50000;

  double get satoshisBitcoins => _satoshisBitcoins;
  int get bitcoinPrice => _bitcoinPrice;

}