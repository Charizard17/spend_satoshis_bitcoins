import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 10),
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
                image: NetworkImage(
                    'https://www.att.com/idpassets/global/devices/phones/apple/apple-iphone-12-mini/carousel/purple/6009D-1.png'),
              ),
              Column(
                children: [
                  SizedBox(height: 10),
                  Text('Cellphone'),
                  SizedBox(height: 10),
                  Text('Price: ₿0.00100000'),
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
                  onPressed: () {},
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
                      child: Text('0'),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: Size(110, 30),
                  ),
                  child: Text('Buy'),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
