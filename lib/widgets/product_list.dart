import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../provider/products.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Products>(context).products;
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, index) => ProductItem(
          loadedProducts[index].id,
          loadedProducts[index].title,
          loadedProducts[index].price,
          loadedProducts[index].imageUrl,
          loadedProducts[index].unique,
        ),
      ),
    );
  }
}
