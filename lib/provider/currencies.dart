import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Currencies with ChangeNotifier {
  var isDollar = false;
  late double _bitcoinPrice = 50000;
  final dollarFormat = new NumberFormat("#,##0.00", "en_US");
  final dollarFormatApi = new NumberFormat("#,##0", "en_US");
  final bitcoinFormat = new NumberFormat("#,##0.00000000", "en_US");

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
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      _bitcoinPrice = responseBody['bitcoin']['usd'].toDouble();
      notifyListeners();
    } else {
      print('An error occured');
      print(response.statusCode);
    }
  }
}
