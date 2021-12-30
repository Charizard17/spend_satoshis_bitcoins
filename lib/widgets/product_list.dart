import 'package:flutter/material.dart';

import './product_item.dart';
import '../models/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Hamburger',
      price: 5.00,
      imageUrl: 'https://im5.ezgif.com/tmp/ezgif-5-abb4360219.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Camera',
      price: 850.00,
      imageUrl: 'https://im5.ezgif.com/tmp/ezgif-5-9b1a5049cd.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Car',
      price: 30000.00,
      imageUrl: 'https://im5.ezgif.com/tmp/ezgif-5-1cc7d5befe.jpg',
    ),
    Product(
      id: 'p4',
      title: 'House',
      price: 150000.00,
      imageUrl: 'https://im5.ezgif.com/tmp/ezgif-5-2a13fe148e.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Yacht',
      price: 1100000.00,
      imageUrl: 'https://im5.ezgif.com/tmp/ezgif-5-89bb5fcaf7.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Plane',
      price: 15000000.00,
      imageUrl: 'https://im5.ezgif.com/tmp/ezgif-5-e101c74a62.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, index) => ProductItem(
          loadedProducts[index].id,
          loadedProducts[index].title,
          loadedProducts[index].price,
          loadedProducts[index].imageUrl,
        ),
      ),
    );
  }
}
