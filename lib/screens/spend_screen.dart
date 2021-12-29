import 'package:flutter/material.dart';

import '../widgets/product_list.dart';

class SpendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          right: 10,
          bottom: 20,
          left: 10,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('₿1 = \$50,000'),
                  Icon(Icons.menu),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 300,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.orange),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange,
                    backgroundImage: NetworkImage(
                        'https://personal-financial.com/wp-content/uploads/2020/06/The-day-the-true-false-Satoshi-Nakamoto-received-102-BTC.jpg'),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.info,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                        Text('Satoshi Nakamoto'),
                        Text('₿1,125,150'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.orange,
            ),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
