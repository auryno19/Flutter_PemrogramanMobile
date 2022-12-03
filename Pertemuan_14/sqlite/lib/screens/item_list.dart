import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqlite/models/item.dart';
import  'package:sqlite/utils/database_helper.dart';
import 'package:sqlite/screens/item_detail.dart';
import 'package:sqflite/sqflite.dart';

class ItemList extends StatefulWidget{


  int count = 0;


  @override
  State<StatefulWidget> createState() {
    
    return ItemListState();
  }
}

class ItemListState extends State<ItemList>{

  DatabaseHelper databaseHelper = DatabaseHelper();
  late List<Item> itemList = List<Item>.empty();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (itemList != null) {
      itemList = List<Item>.empty();
      updateListView();
    }
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),

      body: getItemListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Item('', ''),'Tambah Item');
        },

        tooltip: 'Tambah Item',

        child: Icon(Icons.add),

      ),
    );
  }

  ListView getItemListView(){

    TextStyle? titleStyle = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position ){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.person),
            ),

            title: Text(this.itemList[position].name, style: titleStyle,),

            subtitle: Text(this.itemList[position].price),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey,),
              onTap: () {
                _delete(context, itemList[position]);
              },
            ),
            

            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.itemList[position],'Edit Item');
            },
          ),
        );
      },
    );
  }

  void _delete(BuildContext context, Item item) async{

    int result = await databaseHelper.deleteItem(item.id);
    if(result != 0){
      _showSnackBar(context, 'Item Berhasil di hapus');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message){

    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Item item, String title) async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context){
      return ItemDetail(item, title);
    }));

    if(result == true){
      updateListView();
    }
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){

      Future<List<Item>> itemListFuture = databaseHelper.getItemList();
      itemListFuture.then((itemList){
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }

}