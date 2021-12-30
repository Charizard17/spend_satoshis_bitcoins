import 'package:flutter/material.dart';

import './product_item.dart';
import '../models/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Hamburger',
      price: 5.00,
      imageUrl:
          'https://media.istockphoto.com/photos/simple-meat-burger-isolated-on-white-picture-id157696235',
    ),
    Product(
      id: 'p2',
      title: 'Camera',
      price: 850.00,
      imageUrl:
          'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=700&q=80',
    ),
    Product(
      id: 'p3',
      title: 'Car',
      price: 30000.00,
      imageUrl:
          'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=700&q=80',
    ),
    Product(
      id: 'p4',
      title: 'House',
      price: 150000.00,
      imageUrl:
          'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=700&q=80',
    ),
    Product(
      id: 'p5',
      title: 'Yacht',
      price: 1100000.00,
      imageUrl:
          'https://media.istockphoto.com/photos/motorboat-picture-id157693170',
    ),
    Product(
      id: 'p6',
      title: 'Plane',
      price: 15000000.00,
      imageUrl:
          'https://media.istockphoto.com/photos/airbus-a320-aeroplane-picture-id171264813',
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
