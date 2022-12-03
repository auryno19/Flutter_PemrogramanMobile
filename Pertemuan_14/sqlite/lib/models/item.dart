import 'package:flutter/cupertino.dart';

class Item {

  late int _id;
  late String _name;
  late String _price;
  
  Item(this._name, this._price);

  Item.withId(this._id, this._name, this._price);

  int get id => _id;

  String get name => _name;

  String get price => _price;
  
  set name(String newName){
    this._name = newName;
  }

  set price(String newPrice){
    this._price = newPrice;
  }

  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();
    if (id != null){
      map['id'] = _id;
    }
    map['name'] = _name;
    map['price'] = _price;

    return map;
  }

  Item.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._price = map['price'];
  }
}