import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Big Mac',
      price: 3.79,
      imageUrl: 'assets/images/big-mac.png',
    ),
    Product(
      id: 'p2',
      title: 'Camera',
      price: 483.39,
      imageUrl: 'assets/images/camera.png',
    ),
    Product(
      id: 'p3',
      title: 'Donate',
      price: 1000.00,
      imageUrl: 'assets/images/donate.png',
    ),
    Product(
      id: 'p4',
      title: 'House',
      price: 274900.00,
      imageUrl: 'assets/images/house.png',
    ),
    Product(
      id: 'p5',
      title: 'Luxury Yacht',
      price: 44000000.00,
      imageUrl: 'assets/images/luxury-yacht.png',
    ),
    Product(
      id: 'p6',
      title: 'F-35',
      price: 116000000.00,
      imageUrl: 'assets/images/f-35.png',
    ),
    Product(
      id: 'p7',
      title: '1 kg Gold Bar',
      price: 60460.05,
      imageUrl: 'assets/images/1-kg-gold-bar.png',
    ),
    Product(
      id: 'p8',
      title: 'Tesla Model Y',
      price: 60000.00,
      imageUrl: 'assets/images/tesla-model-y.png',
    ),
    Product(
      id: 'p9',
      title: 'Ferrari SF90',
      price: 475306.00,
      imageUrl: 'assets/images/ferrari-sf90.png',
    ),
    Product(
      id: 'p10',
      title: 'Private Island',
      price: 60000000.00,
      imageUrl: 'assets/images/private-island.png',
    ),
    Product(
      id: 'p11',
      title: 'Make a movie',
      price: 35000000.00,
      imageUrl: 'assets/images/make-a-movie.png',
    ),
    Product(
      id: 'p12',
      title: 'Boeing 777',
      price: 279000000.00,
      imageUrl: 'assets/images/boeing-777.png',
    ),
    Product(
      id: 'p13',
      title: 'T-shirts',
      price: 10.00,
      imageUrl: 'assets/images/t-shirts.png',
    ),
    Product(
      id: 'p14',
      title: 'Jeans',
      price: 44.08,
      imageUrl: 'assets/images/jeans.png',
    ),
    Product(
      id: 'p15',
      title: 'Burj Khalifa',
      price: 1500000000.00,
      imageUrl: 'assets/images/burj-khalifa.png',
    ),
    Product(
      id: 'p16',
      title: 'Mona Lisa',
      price: 860000000.00,
      imageUrl: 'assets/images/mona-lisa.png',
    ),
    Product(
      id: 'p17',
      title: 'Football Club',
      price: 984131023.75,
      imageUrl: 'assets/images/manchester-united.png',
    ),
    Product(
      id: 'p18',
      title: 'NBA Team',
      price: 5000000000.00,
      imageUrl: 'assets/images/los-angeles-lakers.png',
    ),
    Product(
      id: 'p19',
      title: 'Formula 1 Car',
      price: 15000000.00,
      imageUrl: 'assets/images/formula-1-car.png',
    ),
    Product(
      id: 'p20',
      title: 'Iphone 13 Pro Max',
      price: 1399.00,
      imageUrl: 'assets/images/iphone-13-pro-max.png',
    ),
    Product(
      id: 'p21',
      title: 'Macbook Pro',
      price: 3499.00,
      imageUrl: 'assets/images/macbook-pro.png',
    ),
    Product(
      id: 'p22',
      title: 'Race Bike',
      price: 7500.00,
      imageUrl: 'assets/images/race-bike.png',
    ),
    Product(
      id: 'p23',
      title: 'Amazon Kindle',
      price: 89.99,
      imageUrl: 'assets/images/amazon-kindle.png',
    ),
    Product(
      id: 'p24',
      title: 'Farmland per acre',
      price: 1480.00,
      imageUrl: 'assets/images/farmland.png',
    ),
    Product(
      id: 'p25',
      title: 'Antminer S19',
      price: 15922.39,
      imageUrl: 'assets/images/antminer-s19.png',
    ),
    Product(
      id: 'p26',
      title: 'Beats Headphone',
      price: 567.56,
      imageUrl: 'assets/images/beats-headphone.png',
    ),
    Product(
      id: 'p27',
      title: 'Red Bull',
      price: 3.99,
      imageUrl: 'assets/images/red-bull.png',
    ),
    Product(
      id: 'p28',
      title: 'PlayStation 5',
      price: 500.00,
      imageUrl: 'assets/images/playstation-5.png',
    ),
    Product(
      id: 'p29',
      title: 'Rolex',
      price: 12306.61,
      imageUrl: 'assets/images/rolex.png',
    ),
    Product(
      id: 'p30',
      title: 'Books',
      price: 16.00,
      imageUrl: 'assets/images/books.png',
    ),
    Product(
      id: 'p31',
      title: '12.5 kg Gold Bar',
      price: 771123.08,
      imageUrl: 'assets/images/12-5-kg-gold-bar.png',
    ),
  ];

  List<Product> get products {
    // _products.shuffle();
    _products.sort((a, b) => a.price.compareTo(b.price));
    return [..._products];
  }
}
