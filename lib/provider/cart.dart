import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  double _satoshisBitcoins = 1125150;

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get satoshisBitcoins => _satoshisBitcoins;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    String formattedTotal = total.toStringAsFixed(8);
    total = double.parse(formattedTotal);
    return total;
  }

  void buyItem(
    String productId,
    double price,
    String title,
    double bitcoinPrice,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          productId: existingCartItem.productId,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
      _satoshisBitcoins -= price / bitcoinPrice;
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          productId: productId,
          title: title,
          price: price,
          quantity: 1,
        ),
      );
      _satoshisBitcoins -= price / bitcoinPrice;
    }
    notifyListeners();
  }

  void sellItem(
    String productId,
    double price,
    String title,
    double bitcoinPrice,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          productId: existingCartItem.productId,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
        ),
      );
      _items.removeWhere((key, item) => item.quantity == 0);
      _satoshisBitcoins += price / bitcoinPrice;
    }
    notifyListeners();
  }
}
