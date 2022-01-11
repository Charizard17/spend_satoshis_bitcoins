import 'package:flutter_test/flutter_test.dart';
import 'package:spend_satoshis_bitcoins/provider/cart.dart';

void main() {
  group('Cart', () {
    test(
        'Given testProductId is initially empty, When buyItem is called, Then items contains the product',
        () {
      final cart = Cart();

      cart.buyItem('testProductId', 55, 'productTitle', 50000);

      expect(cart.items['testProductId']?.quantity, 1);
    });

    test(
        'Given testProductId is initially there, When buyItem is called, Then increment the quantity',
        () {
      final cart = Cart();

      cart.buyItem('testProductId', 55, 'productTitle', 50000);
      cart.buyItem('testProductId', 55, 'productTitle', 50000);

      expect(cart.items['testProductId']?.quantity, 2);
    });

    test(
        'Given testProductId is initially there, When sellItem is called, Then decrement the quantity',
        () {
      final cart = Cart();

      cart.buyItem('testProductId', 55, 'productTitle', 50000);
      cart.sellItem('testProductId', 55, 'productTitle', 50000);

      expect(cart.items['testProductId']?.quantity, 0);
    });

    test(
        'Initial Total Amount is 0.0, When buyItem is called, Then increase total amount by product price',
        () {
      final cart = Cart();

      cart.buyItem('testProductId', 55, 'productTitle', 50000);

      expect(cart.totalAmount, 55);
    });
  });
}
