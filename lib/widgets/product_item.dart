import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/currencies.dart';
import '../provider/cart.dart';

class ProductItem extends StatefulWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final bool unique;

  ProductItem(this.id, this.title, this.price, this.imageUrl, this.unique);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    final currency = Provider.of<Currencies>(context, listen: true);
    bool _isDollar = currency.isDollar;
    double _bitcoinPrice = currency.bitcoinPrice;
    final cart = Provider.of<Cart>(context, listen: true);
    double _satoshisBitcoins = cart.satoshisBitcoins;
    final dollarFormat = currency.dollarFormat;
    final bitcoinFormat = currency.bitcoinFormat;

    cart.items.forEach((key, item) {
      if (item.productId == widget.id) {
        setState(() {
          _quantity = item.quantity;
        });
      }
    });

    Widget buyButton(variable) => ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            disabledForegroundColor: Colors.green,
            fixedSize: Size(100, 25),
            side: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: Text(
            'Buy',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Revamped',
            ),
          ),
          onPressed: variable
              ? () {
                  cart.buyItem(
                      widget.id, widget.price, widget.title, _bitcoinPrice);
                }
              : null,
        );

    return Container(
      width: double.infinity,
      height: 145,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              Image(
                width: 80,
                height: 80,
                fit: BoxFit.contain,
                image: AssetImage(widget.imageUrl),
              ),
              Expanded(child: Container()),
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _isDollar == true
                          ? 'Price: \$ ${dollarFormat.format(widget.price)}'
                          : 'Price: ₿ ${bitcoinFormat.format(widget.price / _bitcoinPrice)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    disabledForegroundColor:
                        Theme.of(context).colorScheme.error,
                    fixedSize: Size(100, 25),
                    side: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Text(
                    'Sell',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Revamped',
                    ),
                  ),
                  onPressed: _quantity > 0
                      ? () {
                          cart.sellItem(widget.id, widget.price, widget.title,
                              _bitcoinPrice);
                        }
                      : null,
                ),
                Container(
                  height: 35,
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${_quantity > 0 ? _quantity : 0}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ),
                widget.unique == true
                    ? buyButton(
                        (_satoshisBitcoins > widget.price / _bitcoinPrice) &&
                            _quantity <= 0)
                    : buyButton(
                        _satoshisBitcoins > widget.price / _bitcoinPrice)
              ],
            ),
          )
        ],
      ),
    );
  }
}
