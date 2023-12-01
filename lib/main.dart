import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import './screens/spend_screen.dart';
import './screens/home_screen.dart';
import './provider/currencies.dart';
import './provider/cart.dart';
import './provider/products.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Currencies(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = Provider.of<Currencies>(context, listen: true);
    bool _isDollar = currency.isDollar;

    return MaterialApp(
      title: 'Spend Satoshi\'s Bitcoins',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: _isDollar == false ? Color(0xfff69d46) : Color(0xff6cde07),
          onPrimary: Colors.brown,
          secondary: Colors.green,
          onSecondary: Colors.deepPurple,
          error: Colors.redAccent,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Colors.blueGrey,
          surface: Colors.blue,
          onSurface: Colors.orange,
        ),
        fontFamily: 'Revamped',
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SpendScreen.routeName: (ctx) => SpendScreen(),
      },
    );
  }
}
