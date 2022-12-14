import 'dart:io';
import 'package:tugas_akhir/models/transaksi.dart';
// import 'package:tugas_akhir/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInstance {
  final String databaseName = "my_cash_book.db";
  final int databaseVersion = 2;

  // Atribut di Model Transaksi
  final String tabel_transaksi = 'transaksi';
  final String id = 'id';
  final String type = 'type';
  final String total = 'total';
  final String name = 'name';
  final String createdAt = 'created_at';
  final String updatedAt = 'updated_at';


  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory databaseDirectory = await getApplicationDocumentsDirectory();
    String path = join(databaseDirectory.path, databaseName);
    print('db location : '+ path);
    print('database init');
    return openDatabase(path, version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE ${tabel_transaksi} ($id INTEGER PRIMARY KEY, $name TEXT NULL, $type INTEGER, $total INTEGER, $createdAt TEXT NULL, $updatedAt TEXT NULL)');
  }

  Future<List<Transaksi>> getAll() async {
    final data = await _database!.query(tabel_transaksi);
    List<Transaksi> result =
        data.map((e) => Transaksi.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(tabel_transaksi, row);
    return query;
  }

  Future<int> totalPemasukan() async {
    final query = await _database!.rawQuery(
        "SELECT SUM(total) as total FROM ${tabel_transaksi} WHERE type = 1");
    return int.parse(query.first['total'].toString());
  }

  Future<int> totalPengeluaran() async {
    final query = await _database!.rawQuery(
        "SELECT SUM(total) as total FROM ${tabel_transaksi} WHERE type = 2");
    return int.parse(query.first['total'].toString());
  }

    Future<int> saldo() async {
      int masuk = await totalPemasukan();
      int keluar = await totalPengeluaran();
    return masuk - keluar;
  }

  Future<int> hapus(idTransaksi) async {
    final query = await _database!
        .delete(tabel_transaksi, where: '$id = ?', whereArgs: [idTransaksi]);

    return query;
  }

  Future<int> update(int idTransaksi, Map<String, dynamic> row) async {
    final query = await _database!.update(tabel_transaksi, row,
        where: '$id = ?', whereArgs: [idTransaksi]);
    return query;
  }
}