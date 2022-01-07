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

    return Container(
      width: double.infinity,
      height: 145,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).backgroundColor,
        border: Border.all(
          width: 3,
          color: Colors.orange,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                width: 80,
                height: 80,
                fit: BoxFit.contain,
                image: AssetImage(widget.imageUrl),
              ),
              Column(
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).disabledColor,
                    onSurface: Theme.of(context).disabledColor,
                    fixedSize: Size(100, 25),
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
                      color: Theme.of(context).primaryColor,
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.green,
                    fixedSize: Size(100, 25),
                  ),
                  child: Text(
                    'Buy',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Revamped',
                    ),
                  ),
                  // unique item (Mona Lisa) check must be added...
                  // if unique item, widget.unique property will be true
                  onPressed: _satoshisBitcoins > widget.price / _bitcoinPrice
                      ? () {
                          cart.buyItem(widget.id, widget.price, widget.title,
                              _bitcoinPrice);
                        }
                      : null,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
