import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Currencies with ChangeNotifier {
  var isDollar = false;
  double _satoshisBitcoins = 1125150;
  double _bitcoinPrice = 50000;

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

  Future getLatestPrice() async {
    String _apiURL =
        "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd";
    var url = Uri.parse(_apiURL);
    http.Response response = await http.get(url);
    var responseBody = json.decode(response.body);
    _bitcoinPrice = responseBody['bitcoin']['usd'].toDouble();
    notifyListeners();
  }
}
