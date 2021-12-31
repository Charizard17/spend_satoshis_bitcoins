import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/currencies.dart';
import '../provider/cart.dart';

class ProductItem extends StatefulWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  ProductItem(this.id, this.title, this.price, this.imageUrl);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int _itemQuantity = 0;
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    double _bitcoinPrice =
        Provider.of<Currencies>(context).bitcoinPrice;
    final cart = Provider.of<Cart>(context, listen: true);

    cart.items.forEach((key, item) {
      if (item.productId == widget.id) {
        setState(() {
          _quantity = item.quantity;
        });
      }
    });

    _sellItem() {
      cart.sellItem(widget.id, widget.price, widget.title);
    }

    return Container(
      width: double.infinity,
      height: 140,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 235, 227, 158),
        border: Border.all(
          width: 1,
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
                image: NetworkImage(widget.imageUrl),
              ),
              Column(
                children: [
                  SizedBox(height: 10),
                  Text(widget.title),
                  SizedBox(height: 10),
                  Text(
                      'Price: ₿${(widget.price / _bitcoinPrice).toStringAsFixed(8)}'),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: Size(110, 30),
                  ),
                  child: Text('Sell'),
                  onPressed: _quantity > 0
                      ? () {
                          cart.sellItem(widget.id, widget.price, widget.title);
                        }
                      : null,
                ),
                Expanded(
                  child: Container(
                    height: 35,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.purple,
                      ),
                    ),
                    child: Center(
                      child:
                          Text('${_quantity > 0 ? _quantity : _itemQuantity}'),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: Size(110, 30),
                  ),
                  child: Text('Buy'),
                  onPressed: () {
                    cart.buyItem(widget.id, widget.price, widget.title);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
