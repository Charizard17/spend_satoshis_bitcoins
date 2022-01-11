import 'package:flutter_test/flutter_test.dart';
import 'package:spend_satoshis_bitcoins/provider/products.dart';

void main() {
  test('Products added manually. If a new product is added, the number (32) needs to be increased', () {
    final _products = Products();

    expect(_products.products.length, 32);
  });
}
