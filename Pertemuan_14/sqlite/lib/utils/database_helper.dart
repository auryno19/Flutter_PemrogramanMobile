import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:sqlite/models/item.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{

  // static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String itemTable = 'item_table';
  String colId = 'id';
  String colName = 'name';
  String colPrice = ' price'; 

  DatabaseHelper._createInstance();
  static DatabaseHelper instance = DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (instance == null ){
      instance = DatabaseHelper._createInstance();
    }
    
    return instance;
  }

  Future<Database> get database async =>
      _database ??= await initializeDatabase();

  Future<Database> initializeDatabase() async{
    Directory directory =  await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async{
    
    await db.execute('CREATE TABLE $itemTable($colId INTEGER PRIMARY KEY, $colName TEXT, $colPrice TEXT,  )');
  }

  Future<List<Map<String, dynamic>>> getItemMapList() async{
    Database db = await database;

    // var result = await db.rawQuery('SELECT * FROM $itemTable');
    var result = await db.query(itemTable);
    return result;
  }

  Future<int> insertItem(Item item) async{
    Database db = await database;
    var result = await db.insert(itemTable, item.toMap());
    return result;
  }
  
  Future<int> updatetItem(Item item) async{
    Database db = await database;
    var result = await db.update(itemTable, item.toMap(), where: '$colId = ?', whereArgs: [item.id]);
    return result;
  }

  Future<int> deleteItem(int id) async{
    Database db = await database;
    var result = await db.rawDelete('DELETE FROM $itemTable WHERE $colId = $id');
    return result;
  }

  Future<int?> getCount() async{
    Database db = await database;
    List<Map<String, dynamic>> x= await db.rawQuery('SELECT COUNT (*) FROM $itemTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Item>> getItemList() async{
    var itemMapList = await getItemMapList();
    int count = itemMapList.length;

    List<Item> itemList = List<Item>.empty();

    for (int i = 0; i < count; i++){
      itemList.add(Item.fromMapObject(itemMapList[i]));
    }

    return itemList;
  }

}