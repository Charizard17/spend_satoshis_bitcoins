import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/currencies.dart';

class Recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final currency = Provider.of<Currencies>(context, listen: true);
    final _totalAmount = cart.totalAmount;
    var _cartItems = cart.items;
    bool _isDollar = currency.isDollar;
    double _bitcoinPrice = currency.bitcoinPrice;

    var rows = <TableRow>[];
    _cartItems.forEach(((key, value) {
      rows.add(TableRow(
        children: [
          Text('${value.title}'),
          Text('x${value.quantity}'),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              _isDollar == true
                  ? '\$ ${(value.quantity * value.price).toStringAsFixed(2)}'
                  : '₿ ${(value.quantity * value.price / _bitcoinPrice).toStringAsFixed(8)}',
            ),
          ),
        ],
      ));
    }));

    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            'Your Receipt',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Table(
            columnWidths: {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
            },
            children: [
              for (var row in rows) row,
            ],
          ),
          Divider(thickness: 1, color: Colors.black),
          Table(
            columnWidths: {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(3),
            },
            children: [
              TableRow(
                children: [
                  Text(
                    'TOTAL',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    _isDollar == true
                        ? '\$ ${_totalAmount}'
                        : '₿ ${(_totalAmount / _bitcoinPrice).toStringAsFixed(8)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
