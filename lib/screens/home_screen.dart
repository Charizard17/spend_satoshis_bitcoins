import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import './spend_screen.dart';
import '../provider/currencies.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final currency = Provider.of<Currencies>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.grey.withOpacity(0.5),
              ],
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/satoshi-nakamoto.png',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 20, bottom: 10, left: 20),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Raleway',
                    ),
                    children: [
                      TextSpan(
                        text: 'According to a report by ',
                      ),
                      TextSpan(
                        text: 'Whale Alert',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launch(
                              'https://whale-alert.medium.com/the-satoshi-fortune-e49cf73f9a9b',
                            );
                          },
                      ),
                      TextSpan(
                        text: ', ',
                      ),
                      TextSpan(
                        text: 'Satoshi Nakamoto',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' had mined ',
                      ),
                      TextSpan(
                        text: '1,125,150',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' ₿itcoins up to block 54,316 in the chain. ',
                      ),
                      TextSpan(
                        text: 'Source',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            // await launch(
                            //   'https://www.cnbctv18.com/cryptocurrency/satoshi-nakamotos-bitcoin-holding-heres-how-much-it-is-worth-now-11608832.htm',
                            // );
                            await launch(
                              'https://www.nasdaq.com/articles/whale-alert-identifies-1.125-million-btc-as-satoshis-stash-2020-07-20',
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, right: 20, bottom: 20, left: 20),
                child: Text(
                  'In this app you have all the ₿itcoins of Satoshi Nakamoto. You can spend them as you wish!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Start spending',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Revamped',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  currency.getLatestPrice();
                  Navigator.of(context).pushNamed(SpendScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
