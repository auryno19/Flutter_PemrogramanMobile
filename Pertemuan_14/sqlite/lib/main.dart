import 'package:flutter/material.dart';
import 'package:sqlite/screens/item_list.dart';
import 'package:sqlite/screens/item_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Daftar Item',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemList(),
    );
  }
}