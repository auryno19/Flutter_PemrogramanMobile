import 'package:flutter/material.dart';
import 'package:belanja/widgets/Mylistview.dart';
import 'package:belanja/models/item.dart';


// digunakan untuk menampilkan halaman kesatu
class Home_page extends StatelessWidget {
  Home_page({Key? key}) : super(key: key);

  // sumber dari list view ini mengambil dari models item
  final List<Item> items = [
    Item(name: 'Gula', price: 18000, weight: 2),
    Item(name: 'Garam', price: 6000, weight: 1),
    Item(name: 'Beras', price: 90000, weight: 10),
    Item(name: 'Tepung', price: 45000, weight: 1),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: MyListView(
          items: items,
          page: '/item',
        ),
      ));
  }
}