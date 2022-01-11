import 'package:flutter_test/flutter_test.dart';
import 'package:spend_satoshis_bitcoins/provider/products.dart';

void main() {
  test('Initialize product list', () {
    final _products = Products();

    // products added manually
    // if a new product is added, this number (32) needs to be increased
    expect(_products.products.length, 32);
  });
}
