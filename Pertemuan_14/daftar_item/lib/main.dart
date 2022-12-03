import 'package:flutter/material.dart';
import 'package:daftar_item/screens/item_list.dart';
import 'package:daftar_item/screens/item_detail.dart';

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
		    primarySwatch: Colors.blueGrey
	    ),
	    home: ItemList(),
    );
  }
}