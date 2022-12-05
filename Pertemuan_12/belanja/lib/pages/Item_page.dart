import 'package:flutter/material.dart';
import '../widgets/MyCard.dart';

// digunakan untuk menampilkan halaman kedua
class Item_page extends StatelessWidget{
  const Item_page({Key? key,
      required this.name,
      required this.price,
      required this.weight})
      : super(key: key);

  static const routeName = '/item';
  final String name;
  final int price;
  final int weight;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Shopping List'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: MyCard(name: name, price: price, weight: weight),
        ),
      ),
    );
  }
}