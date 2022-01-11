import 'package:flutter_test/flutter_test.dart';
import 'package:spend_satoshis_bitcoins/provider/currencies.dart';

void main() {
  test(
      'Given bool value of isDollar is initial false, When changeCurrency is called, Then isDollar is true',
      () {
    final currency = Currencies();

    currency.changeCurrency();

    expect(currency.isDollar, true);
  });
}
