import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqlite/models/item.dart';
import 'package:sqlite/utils/database_helper.dart';


class ItemDetail extends StatefulWidget {

  final String appBarTitle;
  final Item item;

  ItemDetail(this.item, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return ItemDetailState(this.item, this.appBarTitle);
  }
}

class ItemDetailState extends State<ItemDetail> {

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Item item;

  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  ItemDetailState(this.item, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle? textStyle = Theme.of(context).textTheme.headline6;

    titleController.text = item.name;
    priceController.text = item.price;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(icon: Icon(
          Icons.arrow_back),
          onPressed: () {
            moveToLastScreen();
          }
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Title Text Field');
                  updateTitle();
                },
                decoration: InputDecoration(
                  labelText: 'Item',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ), 
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: priceController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('Something changed in Price Text Field');
                  updatePrice();
                },
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ), 
            ),

            Padding(  
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'save',
                        textScaleFactor: 1.5,
                        ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Save Button clicked");
                          _save();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        foregroundColor: Theme.of(context).primaryColorLight,
                      ), 
                    ),
                  ),

                  Container(width: 5.0,),

                   Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'delete',
                        textScaleFactor: 1.5,
                        ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Delete Button clicked");
                          _delete();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        foregroundColor: Theme.of(context).primaryColorLight,
                      ), 
                      
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  void moveToLastScreen(){
    Navigator.pop(context, true);
  }

  void updateTitle(){
    item.name = titleController.text;
  }

  void updatePrice(){
    item.price = priceController.text;
  }

  void _save() async{

    moveToLastScreen();
    
    int result;
    if(item.id != null){
      result = await helper.updatetItem(item);
    }else{
      result = await helper.insertItem(item);
    }

    if(result != 0){
      _showAlterDialog('Status', 'Item Telah Tersimpan');
    }else{
      _showAlterDialog('Status', 'Terjadi Kesalahan saat menyimpan');
    }

    
  }

  void _delete() async{

    moveToLastScreen();

    if(item.id == null){
      _showAlterDialog('Status', 'Tidak ada yang terhapus');
      return;
    }

    int result = await helper.deleteItem(item.id);
    if(result != 0){
      _showAlterDialog('Status', 'Item berhasil dihapus');
    }else{
      _showAlterDialog('Status', 'Terjadi kesalahan saaat menghapus');
    }
  }

  void _showAlterDialog(String title, String massage){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(massage),
    );
    showDialog(
      context: context, 
      builder: (_) => alertDialog
      );
  }
}
