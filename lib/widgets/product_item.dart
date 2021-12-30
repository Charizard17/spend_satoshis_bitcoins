import 'package:flutter/material.dart';

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
  int _itemCount = 0;
    _buyItem() {
      setState(() {
        ++_itemCount;
      });
    }

    _sellItem() {
      setState(() {
        --_itemCount;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      // margin: EdgeInsets.symmetric(vertical: 10),
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
                  // Text('Price: ₿0.00100000'),
                  Text('Price: \$${widget.price}'),
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
                  onPressed: _itemCount > 0 ? _sellItem : null,
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
                      child: Text('$_itemCount'),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: Size(110, 30),
                  ),
                  child: Text('Buy'),
                  onPressed: _buyItem,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
