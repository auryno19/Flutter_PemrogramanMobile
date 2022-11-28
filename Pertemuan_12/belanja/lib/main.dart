import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // penamaan route bersifat unique
      initialRoute: '/',
      routes: {
        '/': (context) => Home_page(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Item_page.routeName) {
          final args = settings.arguments as Item;
          return MaterialPageRoute(
            builder: (context) {
              return Item_page(
                name: args.name,
                price: args.price,
                weight: args.weight,
              );
            },
          );
        }
        assert(false, '${settings.name}');
        return null;
      },
    );
  }
}
